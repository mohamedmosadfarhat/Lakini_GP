import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakini_gp/constant.dart';
import 'package:lakini_gp/core/utils/api_sevices.dart';
import 'package:lakini_gp/core/utils/styles.dart';
import 'package:lakini_gp/features/ai/data/repo/ai_repo_imp.dart';
import 'package:lakini_gp/features/ai/presentation/manager/image_cubit/search_by_image_cubit.dart';
import 'package:lakini_gp/features/ai/presentation/views/wedgits/result_items_by_image.dart';

class ResultByImage extends StatelessWidget {
  static String id = "ResultScreenByImage";
  ResultByImage(this.pickedImage, {super.key});
  File pickedImage;
  late String imageName = (pickedImage.path.split("/").last);
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              Text(
                "Search with ",
                style: Styles.textStylen,
              ),
              Text(
                "Ai",
                style: Styles.textStylen.copyWith(color: Colors.blue),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        body: BlocProvider(
          create: (context) => SearchByImageCubit(AiRepoImpl(ApiService(Dio())))
            ..fetchResult(imageName),
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: width * .33,
                    height: height * .17,
                    decoration: BoxDecoration(
                      // color: Colors.amber,
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // child: Image.asset("assets/item.png"),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(pickedImage,
                          fit: BoxFit.cover, height: 220, width: 220),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: basicColor,
                        size: 34,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Research Results",
                        style: Styles.textStyle28,
                      )
                    ],
                  ),
                  const Expanded(child: ResultItemsByImage())
                ],
              )),
        ),
      ),
    );
  }
}
