import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:lakini_gp/core/utils/styles.dart';
import 'package:lakini_gp/features/home/data/models/location_model.dart';
import 'package:lakini_gp/features/home/presentation/views/map_screen.dart';
import 'package:lakini_gp/features/posts/presentation/manager/cubit/post_cubit/app_cubit.dart';
import 'package:lakini_gp/features/posts/presentation/manager/cubit/post_cubit/app_state.dart';
import 'package:lakini_gp/features/posts/presentation/views/generate_image.dart';
import 'package:lakini_gp/features/posts/presentation/views/post_added.dart';
import 'package:lakini_gp/features/posts/presentation/widgets/custom_text_field.dart';
import 'package:lakini_gp/features/posts/presentation/widgets/found_reward.dart';
import 'package:lakini_gp/features/posts/presentation/widgets/generate_image_container.dart';
import 'package:lakini_gp/features/posts/presentation/widgets/snackBar_error_widget.dart';
import 'package:lakini_gp/features/register/presentation/views/login_screen.dart';
import 'package:lakini_gp/features/register/widgets/custom_auth_button.dart';
import 'package:location/location.dart';

import 'add_image_container.dart';

String? generatedData;

class PostBodyWidget extends StatefulWidget {
  static const String id = 'PostBodyWidget';
  const PostBodyWidget({
    super.key,
    required this.type,
    required this.locationType,
    required this.dropDownHintText,
  });

  final String type;
  final String locationType;
  final String dropDownHintText;

  @override
  State<PostBodyWidget> createState() => _PostBodyWidgetState();
}

class _PostBodyWidgetState extends State<PostBodyWidget> {
  PlaceLocation? _pickedLocation;

  bool _isLoading = false;

  String get locationImage {
    if (_pickedLocation == null) {
      return "";
    }

    final lat = _pickedLocation!.latitude;
    final lng = _pickedLocation!.longitude;

    return "https://maps.googleapis.com/maps/api/staticmap?center=${locationOfLostFoundController.text},egypt&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:Z%7C$lat,$lng&key=AIzaSyDWYIwIwT2Cx7maujw2kxbcvbFKhIGhLOE";
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
    locationOfLostFoundController.text = _pickedLocation!.address;
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

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController yourPlaceController = TextEditingController();
  final TextEditingController locationOfLostFoundController =
      TextEditingController();
  final TextEditingController foundRewardController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController rewardController = TextEditingController();

  String value = 'reward';

  bool isLoading = false;
  List<String> items = ['Item ', 'cat', 'people', 'Item 4', 'Item 5', 'string'];

  //AddPostRepo? addPostRepo;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Widget previewContent = CustomTextFieldPost(
      hintText: 'Enter location of ${widget.locationType}',
      textEditingController: locationOfLostFoundController,
      enable: false,
      widget: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
      ),
    );

    return BlocConsumer<AppCubit, AppState>(listener: (context, state) {
      if (state is AddItemSuccess) {
        buildSnackBar(
            context: context,
            text: "Item Added Successfully",
            clr: const Color(0xff011730));
        Navigator.pushReplacementNamed(context, PostAddedSuccessScreen.id);
      } else if (state is AddItemFailure) {
        showSnackBarMessage(context, "Failed To Add Item");
      }
    }, builder: (context, state) {
      var cubit = AppCubit.get(context);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Category*",
            style: Styles.textStyle18,
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: const Color(0xff011730),
                    title: Text(
                      "What Are You ${widget.type}",
                      style: Styles.textStyle18,
                    ),
                    content: SingleChildScrollView(
                      child: Column(
                        children: cubit.category!.category.map((category) {
                          return ListTile(
                            title: Text(
                              category.categoryName,
                              style: Styles.textStyle16,
                            ),
                            onTap: () {
                              typeController.text = category.categoryName;
                              Navigator.of(context).pop();
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              );
            },
            child: CustomTextFieldPost(
              hintText: 'Enter your ${widget.type} Type',
              textEditingController: typeController,
              enable: false,
              widget: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            'Add photo',
            style: Styles.textStyle18,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: GestureDetector(
                  onTap: cubit.fetchImage,
                  child: generatedData != null
                      ? Image.network(
                          generatedData!,
                          width: 96,
                          height: 96,
                          fit: BoxFit.cover,
                        )
                      : cubit.pickedImage == null
                          ? const UploadImg()
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.file(cubit.pickedImage!,
                                  fit: BoxFit.cover, height: 220, width: 220),
                            ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, GenerateImageScreen.id);
                },
                child: const GenerateImageContainer(),
              ),
            ],
          ),
          Text(
            'Add title',
            style: Styles.textStyle18,
          ),
          CustomTextFieldPost(
            hintText: 'Add Title',
            textEditingController: nameController,
          ),
          Text(
            'Add caption',
            style: Styles.textStyle18.copyWith(color: Colors.white),
          ),
          CustomTextFieldPost(
            hintText: 'Add caption',
            textEditingController: descController,
            max: 5,
          ),
          Text(
            'Your phone',
            style: Styles.textStyle18,
          ),
          CustomTextFieldPost(
            hintText: '+20 01 789 9348',
            icon: Icons.phone_outlined,
            textEditingController: phoneController,
            type: TextInputType.number,
          ),
          Text(
            'Location of ${widget.locationType}*',
            style: Styles.textStyle18,
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: const Color(0xff011730),
                    title: Text(
                      "Please Choose The Location",
                      style: Styles.textStyle18,
                    ),
                    content: SizedBox(
                      height: height * 0.25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          2,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                Navigator.pop(context);
                                if (index == 0) {
                                  _getCurrentLocation();
                                } else if (index == 1) {
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
                              label: Text(
                                index == 0 ? "Current Location" : "Set On Map",
                                style: Styles.textStyle16,
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
            child: previewContent,
          ),
          if (_pickedLocation != null)
            Image.network(
              locationImage,
              fit: BoxFit.cover,
              height: 170,
              width: double.infinity,
            ),
          if (_isLoading)
            Center(
              child: Image.asset(
                "assets/loadinBall.gif",
                height: height * 0.13,
                width: width * 0.13,
              ),
            ),
          SizedBox(
            height: height * 0.02,
          ),
          Visibility(
            visible: widget.locationType.toLowerCase() == 'lost',
            /*This for Found tab*/
            replacement: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add a price if no owner is found',
                  style: Styles.textStyle18,
                ),
                FoundReward(
                  textEditingController: foundRewardController,
                ),
              ],
            ),

            /*This for lost tab*/
            child: Row(
              children: [
                Material(
                  type: MaterialType.transparency,
                  child: Radio(
                    activeColor: mainColor,
                    value: 'Add a reward',
                    groupValue: value,
                    onChanged: (val) {
                      setState(() {
                        value = val!;
                      });
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
                Text(
                  'Add a reward',
                  style: Styles.textStyle16,
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(8),
                  height: height * 0.06,
                  width: width * 0.3,
                  decoration: BoxDecoration(
                    color: const Color(0xff0E1823),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: rewardController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(7),
                              border: InputBorder.none,
                              hintText: '0000',
                              hintStyle: Styles.textStyle18
                                  .copyWith(color: const Color(0xff555557))),
                        ),
                      ),
                      Text(
                        'EGP',
                        style: Styles.textStyle18,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          state is AddItemLoading
              ? Center(
                  child: Image.asset(
                    "assets/loadinBall.gif",
                    height: height * 0.13,
                    width: width * 0.13,
                  ),
                )
              : CustomRegisterButton(
                  text: 'Add',
                  onPressed: () {
                    if (locationOfLostFoundController.text.isEmpty ||
                        _pickedLocation == null ||
                        typeController.text.isEmpty ||
                        nameController.text.isEmpty ||
                        descController.text.isEmpty ||
                        phoneController.text.isEmpty) {
                      buildSnackBar(
                          context: context,
                          text: "Please Fill All Fields!",
                          clr: const Color.fromARGB(255, 92, 1, 1));
                    } else if (cubit.pickedImage == null) {
                      buildSnackBar(
                          context: context,
                          text: "Please Upload The Image",
                          clr: const Color.fromARGB(255, 92, 1, 1));
                    } else {
                      cubit.submit(
                        lostType: typeController.text,
                        title: nameController.text,
                        caption: descController.text,
                        phoneNumber: phoneController.text.toString(),
                        location: _pickedLocation?.address.toString() ??
                            locationOfLostFoundController.text,
                        status: widget.type,
                        reward: rewardController.text.toString(),
                        lat: _pickedLocation?.latitude,
                        lng: _pickedLocation?.longitude,
                      );
                    }
                  }),
        ],
      );
    });
  }
}
