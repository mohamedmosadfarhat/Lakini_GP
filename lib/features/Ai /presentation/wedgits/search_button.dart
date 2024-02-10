import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class SearchButton extends StatelessWidget {
  //const SearchButton({Key? key}) : super(key: key);
  void Function() onTap;
  IconData icon;
  String hint;
  SearchButton(
      {super.key, required this.hint, required this.icon, required this.onTap});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Flexible(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .005),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon),
                  SizedBox(
                    width: width * .022,
                  ),
                  Text(
                    hint,
                    style: Styles.textStyle16.copyWith(color: Colors.grey[400]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
