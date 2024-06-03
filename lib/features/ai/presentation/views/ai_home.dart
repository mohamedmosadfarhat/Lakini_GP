import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakini_gp/core/utils/api_sevices.dart';
import 'package:lakini_gp/features/ai/data/repo/ai_repo_imp.dart';
import 'package:lakini_gp/features/ai/presentation/manager/image_cubit/search_by_image_cubit.dart';
import 'package:lakini_gp/features/ai/presentation/views/search_by_camera_or_photo.dart';
import 'package:lakini_gp/features/ai/presentation/views/search_by_description.dart';
import 'package:lakini_gp/features/ai/presentation/views/wedgits/model_type_icon.dart';

class AiHome extends StatefulWidget {
  const AiHome({Key? key}) : super(key: key);
  static const aihome = "aihome";

  @override
  State<AiHome> createState() => _AiHomeState();
}

class _AiHomeState extends State<AiHome> {
  int modelType = 1;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => SearchByImageCubit(AiRepoImpl(ApiService(Dio()))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Image.asset(
              "assets/searchbackground.png",
              fit: BoxFit.fill,
              height: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 15),
              child: IconButton(
                alignment: Alignment.topLeft,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height * .2),
                  child: Container(
                    alignment: Alignment.center,
                    child: SizedBox(
                      child: Image.asset(
                        alignment: Alignment.center,
                        "assets/location (2) 2.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                ClipPath(
                  //clipper: MyClipper(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.elliptical(width, 100.0)),
                      gradient: const LinearGradient(
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
                      border: const Border(
                          top: BorderSide(color: Colors.blue, width: 1)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * .04,
                        ),
                        const Text(
                          "LAKINY",
                          style: TextStyle(
                              fontSize: 34, fontWeight: FontWeight.bold),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Best search with ",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Ai",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * .05,
                        ),
                        BlocConsumer<SearchByImageCubit, SearchByImageState>(
                          listener: (context, state) {
                            // TODO: implement listener
                          },
                          builder: (context, state) {
                            var modelTypeCubit =
                                BlocProvider.of<SearchByImageCubit>(context);
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ModelTypeIcon(
                                  text: "Peaple",
                                  color: modelTypeCubit.modelType == 1
                                      ? const Color(0xff0075FF)
                                      : const Color(0xff00102B),
                                  width: width,
                                  modelType: 0,
                                  onTap: () {
                                    modelTypeCubit.ModelType(1);
                                    print(modelTypeCubit.modelType);
                                    // setState(() {
                                    //   modelType = 0;
                                    // });
                                  },
                                ),
                                ModelTypeIcon(
                                  text: "Other",
                                  color: modelTypeCubit.modelType == 0
                                      ? Color(0xff0075FF)
                                      : Color(0xff00102B),
                                  width: width,
                                  modelType: 1,
                                  onTap: () {
                                    modelTypeCubit.ModelType(0);
                                    print(modelTypeCubit.modelType);
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SearchTypeIcon(
                              text: "Add Photo",
                              icon: const Icon(
                                Icons.photo,
                                size: 24,
                              ),
                              onpressed: () {
                                Navigator.of(context).pushNamed(
                                  SearchByCameraOrPhoto.id,
                                );
                              },
                            ),
                            SearchTypeIcon(
                              text: "Add Description",
                              icon: const Icon(
                                Icons.description,
                                size: 24,
                              ),
                              onpressed: () {
                                Navigator.of(context).pushNamed(
                                  SearchByDescription.id,
                                );
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * .01,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SearchTypeIcon extends StatelessWidget {
  const SearchTypeIcon({
    super.key,
    required this.onpressed,
    required this.text,
    required this.icon,
  });
  final Function()? onpressed;
  final String text;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0xff0E1824),
            shape: BoxShape.circle,
            // borderRadius: BorderRadius.circular(300),
          ),
          child: IconButton(
            onPressed: onpressed,
            icon: icon,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height * .1);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(MyClipper oldClipper) => true;
}
// class MyClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     // Define a custom path to create a stylish clipped shape
//     var path = Path();
//     path.moveTo(0, size.height * 0.5);
//     path.lineTo(size.width * 0.2, 0);
//     path.lineTo(size.width * 0.8, 0);
//     path.lineTo(size.width, size.height * 0.5);
//     path.lineTo(size.width * 0.8, size.height);
//     path.lineTo(size.width * 0.2, size.height);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
