import 'package:flutter/material.dart';
import 'package:lakini_gp/core/utils/styles.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 17.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blue),
          color: Color(0xff182533),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                // width: width * .32,
                //height: height * .5,
                child: Image.asset(
                  "assets/cat_test.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: width * .50,
              //height: height * .6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "cat seami",
                    style: Styles.textStyle18,
                  ),
                  Text(
                    "lost male seami in biala lost male seami",
                    style: Styles.textStyle16,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Color(0xffFA9600),
                      ),
                      SizedBox(
                        width: width * .001,
                      ),
                      Text(
                        "Biala Kafr El_Sheikh",
                        style: Styles.textStyle14,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_view_month_rounded,
                      ),
                      SizedBox(
                        width: width * .001,
                      ),
                      Text(
                        "September 25 - 24",
                        style: Styles.textStyle14,
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   height: 5,
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
