import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:http/http.dart' as http;
import 'package:lakini_gp/constant.dart';
import 'package:lakini_gp/core/utils/styles.dart';
import 'package:lakini_gp/features/home/data/models/item_model.dart';
import 'package:lakini_gp/features/home/data/models/location_model.dart';
import 'package:lakini_gp/features/home/presentation/views/wedgits/capitalize_extension.dart';
import 'package:location/location.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'map_screen.dart';

class ItemDetails extends StatefulWidget {
  static const String itemId = "ItemDetailsId";

  const ItemDetails({
    super.key,
  });

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  PlaceLocation? _pickedLocation;
  bool _isLoading = false;
  String? _error;

  String get locationImage {
    if (_pickedLocation == null) {
      return "";
    }

    final lat = _pickedLocation!.latitude;
    final lng = _pickedLocation!.longitude;
    return "https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:R%7C$lat,$lng&key=AIzaSyDWYIwIwT2Cx7maujw2kxbcvbFKhIGhLOE";
  }

  void _savePlace(double lat, double lng) async {
    final url = Uri.parse(
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=AIzaSyDWYIwIwT2Cx7maujw2kxbcvbFKhIGhLOE");
    try {
      final res = await http.get(url);
      if (res.statusCode >= 404) {
        setState(() {
          _error = "Failed to fetch data. Please try again later!!";
        });
      }
      final resData = json.decode(res.body);
      final address = resData["results"][0]["formatted_address"];
      setState(() {
        _pickedLocation =
            PlaceLocation(latitude: lat, longitude: lng, address: address);
        _isLoading = false;
      });
    } catch (err) {
      setState(() {
        _error = "Something Went Wrong. Please try again later!!";
      });
    }
  }

  void _getLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        _error = "Access Denied!";
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        _error = "Access Denied!";
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

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  @override
  Widget build(BuildContext context) {
    var itemModel = ModalRoute.of(context)!.settings.arguments as ItemModel;

    Widget previewContent = Center(
      child: Text(
        "Access Denied!",
        style: Styles.textStyle18,
        textAlign: TextAlign.center,
      ),
    );
    if (_pickedLocation != null) {
      previewContent = Image.network(
        locationImage,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }
    if (_isLoading) {
      previewContent = const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (_error != null) {
      previewContent = Center(
        child: Text(_error!),
      );
    }

    List<String> itemImages = [
      "https://wdw888lb-7075.uks1.devtunnels.ms/resources/${itemModel.itemImage}",
    ];
    var imgView = PageController();
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 418,
                  child: PageView.builder(
                    controller: imgView,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          child: SizedBox(
                            width: double.infinity,
                            height: 418,
                            child: Image.network(
                              itemImages[index],
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    itemCount: itemImages.length,
                  ),
                ),
                Positioned(
                  top: 300,
                  left: 195,
                  child: SmoothPageIndicator(
                    controller: imgView,
                    count: itemImages.length,
                    effect: const JumpingDotEffect(
                        verticalOffset: 30,
                        jumpScale: 1.6,
                        activeDotColor: Color.fromRGBO(1, 23, 48, 1),
                        dotWidth: 12,
                        dotHeight: 8),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 50.0, horizontal: 10),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      radius: 16,
                      backgroundColor: Color.fromRGBO(69, 90, 100, 1),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 350.0),
                  child: Container(
                    width: double.infinity,
                    height: 740,
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
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                height: 4,
                                width: width * 0.15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  child: Image.network(
                                    "https://wdw888lb-7075.uks1.devtunnels.ms/resources/${itemModel.userImage}",
                                    //  https://wdw888lb-7075.uks1.devtunnels.ms/resources/${itemModel.itemImage}
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "${itemModel.userName}",
                                      style: Styles.textStyle18,
                                    ),
                                    Text(
                                      "${itemModel.foundDate}",
                                      style: Styles.textStyle14,
                                    )
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  width: 72,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                          color: const Color.fromRGBO(
                                              20, 167, 0, 1)),
                                      color: const Color.fromRGBO(5, 44, 7, 1)),
                                  child: Center(
                                    child: Text(
                                      "${itemModel.itemStatus}".capitalize(),
                                      style: Styles.textStyle14.copyWith(
                                        color:
                                            const Color.fromRGBO(20, 167, 0, 1),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 361,
                            height: 165,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: const Color.fromRGBO(10, 17, 32, 1)),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${itemModel.itemName}",
                                    style: Styles.textStyle18,
                                  ),
                                  Text(
                                    "${itemModel.description}",
                                    style: Styles.textStyle14,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            height: 50,
                            width: 350,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(10, 17, 32, 1),
                                borderRadius: BorderRadius.circular(6)),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.celebration_outlined,
                                  color: Color.fromRGBO(189, 255, 0, 1),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Reward",
                                  style: Styles.textStyle16,
                                ),
                                const Spacer(),
                                Text(
                                  "${itemModel.itemAward}",
                                  style: Styles.textStyle16.copyWith(
                                      color:
                                          const Color.fromRGBO(189, 255, 0, 1)),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 32.0),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    FlutterPhoneDirectCaller.callNumber(
                                        "${itemModel.phoneNumber}");
                                  },
                                  child: Container(
                                    width: 95,
                                    height: 48,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.white),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.call,
                                          color: Colors.blueAccent,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Call",
                                          style: Styles.textStyle16
                                              .copyWith(color: basicColor),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 14,
                                ),
                                Container(
                                  height: 48,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.blue),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.sms,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Message in the ap",
                                        style: Styles.textStyle16,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 35.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Color(0xffFA9600),
                                      size: 20,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Location",
                                      style: Styles.textStyle20,
                                    ),
                                  ],
                                ),
                                Text("${itemModel.foundPlace}")
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => MapScreen(
                                    location: _pickedLocation!,
                                    isSelected: false,
                                  ),
                                ),
                              );
                            },
                            child: SizedBox(
                              width: 361,
                              height: 255,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: previewContent,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
