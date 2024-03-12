import 'package:flutter/material.dart';

class UploadImg extends StatelessWidget {
  const UploadImg({super.key});

  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.only(top: 12, bottom: 24),
      height: 96,
      width: 96,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        //border: Border.all(style: BorderStyle.solid),
        color: const Color.fromRGBO(14, 24, 35, 1),
      ),
      child: const Center(
        child: Icon(
          Icons.add_photo_alternate_outlined,
          size: 38,
          color: Colors.grey,
        ),
      ),
    );
  }
}
