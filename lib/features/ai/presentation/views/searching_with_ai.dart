import 'package:flutter/material.dart';
import 'package:lakini_gp/core/utils/styles.dart';

import '../wedgits/search_button.dart';

class SearchingWithAi extends StatelessWidget {
  const SearchingWithAi({Key? key}) : super(key: key);
  static String id = 'SearchingWithAi';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff011730),
            Color(0xff00070F),
            Color(0xff00070F),
            Color(0xff000205),
            Color(0xff000205),
            Color(0xff011730),
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
            children: [
              Text(
                "Search with ",
                style: Styles.textStyle30,
              ),
              Text(
                "Ai",
                style: Styles.textStyle30.copyWith(color: Colors.blue),
              ),
            ],
          ),
        ),
        body: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SearchButton(
                      hint: "Camera",
                      onTap: () {},
                      icon: Icons.camera_enhance,
                    ),
                    SearchButton(
                      hint: "Photo",
                      onTap: () {},
                      icon: Icons.photo,
                    ),
                    SearchButton(
                      hint: "Text",
                      onTap: () {},
                      icon: Icons.edit,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.07,
                ),
                Container(
                  width: width * .8,
                  height: height * .5,
                  decoration: BoxDecoration(
                    // color: Colors.amber,
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.blue, width: 3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                SizedBox(
                  height: height * .12,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[300],
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue)),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
