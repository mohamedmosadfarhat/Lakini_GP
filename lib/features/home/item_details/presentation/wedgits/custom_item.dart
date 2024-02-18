import 'package:flutter/material.dart';
import 'package:lakini_gp/core/utils/styles.dart';
import 'package:lakini_gp/features/home/item_details/presentation/wedgits/capitalize_extension.dart';

import '../../screen/item_details_screen.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ItemDetails.itemId);
      },
      child: Padding(
        padding: EdgeInsets.only(
          bottom: height * .024,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blue),
            color: Color(0xff182533),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                ),
                child: Container(
                  width: width * .33,
                  height: height * .18,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    child: Image.asset(
                      "assets/cat_test.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Container(
                width: width * .53,
                height: height * .18,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * .01,
                    ),
                    Text(
                      "cat seami"
                          .capitalize()
                          .split(' ')
                          .map((word) => word.capitalize())
                          .join(' '),
                      style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.w700, fontFamily: "inter"),
                    ),
                    Text(
                      "lost male seami in biala lost male seami  ".capitalize(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Styles.textStyle16,
                    ),
                    SizedBox(
                      height: height * .005,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Color(0xffFA9600),
                          size: 20,
                        ),
                        SizedBox(
                          width: width * .02,
                        ),
                        Text(
                          "Biala Kafr El_Sheikh".capitalize(),
                          style: Styles.textStyle14,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * .006,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_view_month_rounded,
                          size: 20,
                        ),
                        SizedBox(
                          width: width * .02,
                        ),
                        Text(
                          "September 25 - 24".capitalize(),
                          style: Styles.textStyle14,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
