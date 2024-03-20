import 'package:flutter/material.dart';

import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'package:lakini_gp/constant.dart';
import 'package:lakini_gp/core/utils/styles.dart';
import 'package:lakini_gp/features/home/data/models/item_model.dart';
import 'package:lakini_gp/features/home/data/models/location_model.dart';
import 'package:lakini_gp/features/home/presentation/views/wedgits/capitalize_extension.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../posts/presentation/widgets/custom_text_field.dart';
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
  @override
  void initState() {
    super.initState();
    // _getLocation();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextEditingController locationOfLostFoundController =
        TextEditingController();
    ItemModel itemModel =
        ModalRoute.of(context)!.settings.arguments as ItemModel;
    String locationImage =
        "https://maps.googleapis.com/maps/api/staticmap?center=${itemModel.foundPlace},egypt&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:R%7C${itemModel.foundPlace},egypt&key=AIzaSyDWYIwIwT2Cx7maujw2kxbcvbFKhIGhLOE";

    Widget previewContent = Center(
      child: Text(
        "Access Denied!",
        style: Styles.textStyle18,
        textAlign: TextAlign.center,
      ),
    );
    previewContent = Image.network(
      locationImage,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );

    locationOfLostFoundController.text = itemModel.foundPlace!;

    List<String> itemImages = [
      "https://wdw888lb-7075.uks1.devtunnels.ms/resources/${itemModel.itemImage}",
    ];
    var imgView = PageController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: height * 0.6,
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
                            height: height * 0.5,
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
                  top: height * 0.33,
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
                    height: height * 0.95,
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
                            width: width * 0.9,
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
                            width: width*0.9,
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
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                        "Message in the app",
                                        style: Styles.textStyle16,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: CustomTextFieldPost(
                              hintText: "The Location",
                              textEditingController:
                                  locationOfLostFoundController,
                              enable: false,
                              widget: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                            onTap: () {
                              print(itemModel.itemLatitude);
                              print(itemModel.itemLongitude);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => MapScreen(
                                    location: PlaceLocation(
                                        longitude: itemModel.itemLongitude!,
                                        latitude: itemModel.itemLatitude!,
                                        address: ''),
                                    isSelected: false,
                                  ),
                                ),
                              );
                            },
                            child: SizedBox(
                              width: width*0.9,
                              height: height*0.3,
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
