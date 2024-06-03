
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lakini_gp/core/utils/api_sevices.dart';
import 'package:lakini_gp/core/utils/styles.dart';
import 'package:lakini_gp/features/ai/data/repo/ai_repo_imp.dart';
import 'package:lakini_gp/features/ai/presentation/manager/image_cubit/search_by_image_cubit.dart';
import 'package:lakini_gp/features/ai/presentation/views/wedgits/image_search_button.dart';

import 'wedgits/search_button.dart';

class SearchByCameraOrPhoto extends StatelessWidget {
  const SearchByCameraOrPhoto({Key? key}) : super(key: key);
  static String id = 'SearchByCameraOrPhoto';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => SearchByImageCubit(AiRepoImpl(ApiService(Dio()))),
      child: Container(
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
        child: BlocConsumer<SearchByImageCubit, SearchByImageState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Scaffold(
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
                            onTap: () {
                              BlocProvider.of<SearchByImageCubit>(context)
                                  .fetchImage(ImageSource.camera);
                            },
                            icon: Icons.camera_enhance,
                          ),
                          SizedBox(
                            width: width * .033,
                          ),
                          SearchButton(
                            hint: "Photo",
                            onTap: () {
                              BlocProvider.of<SearchByImageCubit>(context)
                                  .fetchImage(ImageSource.gallery);
                            },
                            icon: Icons.photo,
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
                        // child: Image.asset("assets/item.png"),
                        child: BlocProvider.of<SearchByImageCubit>(context)
                                    .pickedImage ==
                                null
                            ? Image.asset("assets/item.png")
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.file(
                                    BlocProvider.of<SearchByImageCubit>(context)
                                        .pickedImage!,
                                    fit: BoxFit.cover,
                                    height: 220,
                                    width: 220),
                              ),
                      ),
                      SizedBox(
                        height: height * .12,
                      ),
                      Container(
                          width: width * .4,
                          decoration: BoxDecoration(
                            //color: const Color(0xff0066FF),
                            borderRadius: BorderRadius.circular(20),

                            gradient: const LinearGradient(
                              colors: [
                                Color(0xff06D83EA),
                                Color(0xff08B5FF),
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                            // shape: BoxShape.circle,
                            // border: Border.all(color: Colors.blue),
                            border: Border.all(width: 3, color: Colors.white),
                          ),
                          child: const Row(
                            children: [
                              ImageSearchButton(),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
