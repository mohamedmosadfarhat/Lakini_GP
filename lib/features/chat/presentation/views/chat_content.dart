import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lakini_gp/features/chat/presentation/wedgits/popup_menu_item.dart';
import 'package:lakini_gp/features/posts/data/models/users_model.dart';

import 'package:lakini_gp/features/posts/presentation/manager/cubit/post_cubit/app_cubit.dart';
import 'package:lakini_gp/features/posts/presentation/manager/cubit/post_cubit/app_state.dart';
import 'package:lakini_gp/features/register/helper/end_point.dart';
import 'package:location/location.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import '../../../../core/utils/styles.dart';
import '../../../home/data/models/location_model.dart';
import '../../../home/presentation/views/map_screen.dart';
import '../../../posts/data/models/chat_model.dart';
import '../../../posts/helper/chat_methods.dart';
import '../../../register/presentation/views/login_screen.dart';
import '../wedgits/message_bubble.dart';

class ChatContent extends StatefulWidget {
  final AllUsersData user;
  const ChatContent({required this.user, Key? key}) : super(key: key);
  static String id = 'ChatContent';

  @override
  State<ChatContent> createState() => _ChatContentState();
}

class _ChatContentState extends State<ChatContent> {
  late StreamController<List<Chat>> _streamController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _streamController = StreamController<List<Chat>>();
    _startPolling();
  }

  @override
  void dispose() {
    _streamController.close();
    _timer.cancel();

    super.dispose();
  }

  void _startPolling() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      fetchChats(
          senderEmail: AppCubit.get(context).profile!.email,
          receiverEmail: widget.user.email,
          streamController: _streamController);
    });
  }

  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is DeleteChatSuccessState) {
          if (state.delete.status) {
            print(state.delete.message);
            buildSnackBar(
                context: context,
                text: state.delete.message,
                clr: const Color(0xff011730));
          } else {
            buildSnackBar(
                context: context,
                text: state.delete.message,
                clr: const Color.fromARGB(255, 92, 1, 1));
          }
        }
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(1, 23, 48, 1),
                  Color.fromRGBO(1, 23, 48, 1),
                  Color.fromRGBO(0, 7, 15, 1),
                  Color.fromRGBO(0, 7, 15, 1),
                  Color.fromRGBO(0, 2, 5, 1),
                  Color.fromRGBO(1, 23, 48, 1),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://wdw888lb-7075.uks1.devtunnels.ms/resources/${widget.user.accountPhoto}"),
                          radius: 24,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          widget.user.userName,
                          style: Styles.textStyle16,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.call_outlined,
                            color: Colors.white,
                          ),
                        ),
                        PopupMenuButton(
                          color: Colors.black,
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              onTap: () {},
                              child: CustomPopup(
                                hint: "View contact",
                                icon: Icons.person_2_outlined,
                              ),
                            ),
                            PopupMenuItem(
                              onTap: () {},
                              child: CustomPopup(
                                hint: "Mute notification",
                                icon: Icons.notifications_off_outlined,
                              ),
                            ),
                            PopupMenuItem(
                              onTap: () {},
                              child: CustomPopup(
                                hint: "Block",
                                icon: Icons.block,
                              ),
                            ),
                            PopupMenuItem(
                              onTap: () {
                                cubit.deleteChatMethod(widget.user.userId);
                              },
                              child: CustomPopup(
                                hint: "Delete chat",
                                icon: Icons.delete_outline,
                                clr: Colors.red,
                              ),
                            ),
                            // ),
                          ],
                          child: const Icon(Icons.more_vert),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: StreamBuilder<List<Chat>>(
                          stream: _streamController.stream,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: Image.asset(
                                  "assets/loadinBall.gif",
                                  height: height * 0.13,
                                  width: width * 0.13,
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            } else if (snapshot.hasData) {
                              final List<Chat> chats = snapshot.data!;
                              return ListView.builder(
                                  padding: const EdgeInsets.only(
                                    bottom: 40,
                                    left: 13,
                                    right: 13,
                                  ),
                                  itemCount: chats.length,
                                  itemBuilder: (context, index) {
                                    final chat = chats[index];

                                    final nextMessage = index + 1 < chats.length
                                        ? chats[index + 1]
                                        : null;
                                    final currentMessageUserId = chat.senderId;
                                    final nextMessageUserId =
                                        nextMessage != null
                                            ? chat.senderId
                                            : null;

                                    final bool nextUserIsSame =
                                        nextMessageUserId ==
                                            currentMessageUserId;
                                    if (nextUserIsSame) {
                                      return MessageBubble.next(
                                          message: chat.content,
                                          file: chat.file,
                                          lat: chat.latitude,
                                          lng: chat.longitude,
                                          time: chat.timestamp,
                                          isMe: userId == chat.senderId);
                                    } else {
                                      return MessageBubble.first(
                                        userImage: widget.user.accountPhoto,
                                        username: widget.user.userName,
                                        message: chat.content,
                                        lat: chat.latitude,
                                        lng: chat.longitude,
                                        file: chat.file,
                                         time: chat.timestamp,
                                        isMe: userId == currentMessageUserId,
                                      );
                                    }
                                  });
                            } else {
                              return Center(
                                  child: Text(
                                'No chats available',
                                style: Styles.textStyle20,
                              ));
                            }
                          }),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: _pickedLocation != null
                                ? Image.network(
                                    locationImage,
                                    fit: BoxFit.cover,
                                    height: 170,
                                    width: double.infinity,
                                  )
                                : _isLoading
                                    ? Center(
                                        child: Image.asset(
                                          "assets/loadinBall.gif",
                                          height: height * 0.13,
                                          width: width * 0.13,
                                        ),
                                      )
                                    : cubit.pickedchatImage != null
                                        ? Container(
                                            height: 190,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: DecorationImage(
                                                image: FileImage(
                                                  cubit.pickedchatImage!,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                        : Container(
                                            decoration: BoxDecoration(
                                                color: const Color(0xff182533),
                                                borderRadius:
                                                    BorderRadius.circular(22)),
                                            child: TextField(
                                              style: Styles.textStyle16,
                                              controller: messageController,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Message",
                                                prefixIcon: IconButton(
                                                  onPressed: () {
                                                    print(
                                                        'search button pressed');
                                                  },
                                                  icon: const Icon(
                                                    Icons.forum_outlined,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                suffixIcon: SizedBox(
                                                  width: 100,
                                                  child: Row(
                                                    children: [
                                                      IconButton(
                                                        onPressed: () {
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                backgroundColor:
                                                                    const Color(
                                                                        0xff011730),
                                                                title: Text(
                                                                  "Please Choose The Location",
                                                                  style: Styles
                                                                      .textStyle18,
                                                                ),
                                                                content:
                                                                    SizedBox(
                                                                  height:
                                                                      height *
                                                                          0.2,
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: List
                                                                        .generate(
                                                                      2,
                                                                      (index) =>
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                        child: ElevatedButton
                                                                            .icon(
                                                                          onPressed:
                                                                              () async {
                                                                            Navigator.pop(context);
                                                                            if (index ==
                                                                                0) {
                                                                              _getCurrentLocation();
                                                                            } else if (index ==
                                                                                1) {
                                                                              _selectOnMap();
                                                                            }
                                                                          },
                                                                          icon: index == 0
                                                                              ? const Icon(
                                                                                  Icons.location_searching,
                                                                                  color: mainColor,
                                                                                )
                                                                              : const Icon(
                                                                                  Icons.map,
                                                                                  color: mainColor,
                                                                                ),
                                                                          label:
                                                                              Text(
                                                                            index == 0
                                                                                ? "Current Location"
                                                                                : "Set On Map",
                                                                            style:
                                                                                Styles.textStyle16,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        icon: const Icon(
                                                          Icons
                                                              .location_on_outlined,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          cubit
                                                              .fetchchatImage();
                                                        },
                                                        icon: const Icon(
                                                          Icons
                                                              .photo_camera_outlined,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              //
                                            ),
                                          ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              color: const Color(0xff0075FF),
                              borderRadius: BorderRadius.circular(30)),
                          child: IconButton(
                            iconSize: 24,
                            onPressed: () {
                              if (messageController.text.isEmpty &&
                                  cubit.pickedchatImage == null &&
                                  _pickedLocation == null) {
                                return;
                              } else {
                                cubit.sendMessage(
                                  receiverEmail: widget.user.email,
                                  message: messageController.text,
                                  Latitude: _pickedLocation?.latitude ?? 0,
                                  Longitude: _pickedLocation?.longitude ?? 0,
                                );
                                messageController.clear();
                                setState(() {
                                  _pickedLocation = null;
                                });
                              }
                            },
                            icon: const Icon(
                              Icons.send,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }

  PlaceLocation? _pickedLocation;
  bool _isLoading = false;

  String get locationImage {
    if (_pickedLocation == null) {
      return "";
    }

    final lat = _pickedLocation!.latitude;
    final lng = _pickedLocation!.longitude;

    return "https://maps.googleapis.com/maps/api/staticmap?latlng=$lat,$lng&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:Z%7C$lat,$lng&key=AIzaSyDWYIwIwT2Cx7maujw2kxbcvbFKhIGhLOE";
  }

  void _savePlace(double lat, double lng) async {
    final url = Uri.parse(
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=AIzaSyDWYIwIwT2Cx7maujw2kxbcvbFKhIGhLOE");
    final res = await http.get(url);
    final resData = json.decode(res.body);
    final address = resData["results"][0]["formatted_address"];
    setState(() {
      _pickedLocation =
          PlaceLocation(latitude: lat, longitude: lng, address: address);
      _isLoading = false;
    });
    print(_pickedLocation!.address);
  }

  void _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      _isLoading = true;
    });

    locationData = await location.getLocation();
    final lat = locationData.latitude;
    final lng = locationData.longitude;

    if (lat == null || lng == null) {
      return;
    }

    log(locationData.longitude.toString());
    log(locationData.latitude.toString());

    _savePlace(lat, lng);
  }

  void _selectOnMap() async {
    final LatLng? mapLocation = await Navigator.of(context).push<LatLng>(
      MaterialPageRoute(
        builder: (context) => const MapScreen(),
      ),
    );
    if (mapLocation == null) {
      return;
    }

    _savePlace(mapLocation.latitude, mapLocation.longitude);
  }
}
