import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakini_gp/core/utils/styles.dart';
import 'package:lakini_gp/features/posts/data/models/image.dart';
import 'package:lakini_gp/features/posts/data/repos/add_post_repo_imple.dart';
import 'package:lakini_gp/features/posts/presentation/manager/cubit/cubit/generate_image_cubit.dart';
import 'package:lakini_gp/features/posts/presentation/widgets/generate_image_body.dart';
import 'package:lakini_gp/features/posts/services/services_locator.dart';

class GenerateImageScreen extends StatelessWidget {
  const GenerateImageScreen({Key? key, this.imageModel}) : super(key: key);
  static const id = 'generateImgae';
  final ImageModel? imageModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenerateImageCubit(
        getIt.get<ImageGenerateImple>(),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff011730),
                Color(0xff00070F),
                Color(0xff00070F),
                Color(0xff000205),
                Color(0xff000205),
                Color(0xff011730),
              ]),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              'Search for Image',
              style: Styles.textStyle$20.copyWith(
                fontWeight: FontWeight.w700,
                fontFamily: 'Inter',
              ),
            ),
          ),
          body: const GenerateImageBody(),
        ),
      ),
    );
  }
}
