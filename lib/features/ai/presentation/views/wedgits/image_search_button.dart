import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakini_gp/features/ai/presentation/manager/image_cubit/search_by_image_cubit.dart';
import 'package:lakini_gp/features/ai/presentation/views/result_by_image.dart';

class ImageSearchButton extends StatelessWidget {
  const ImageSearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchByImageCubit, SearchByImageState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                BlocProvider.of<SearchByImageCubit>(context).UploadImage();
                if (BlocProvider.of<SearchByImageCubit>(context).pickedImage ==
                    null) {
                  print("please uplooad photo");
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Color(0xff0066FF),
                      content: Text("Please uplooad image"),
                    ),
                  );
                } else if (state is UploadImageLoading) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Color(0xff0066FF),
                      content: Text("please wait"),
                    ),
                  );
                } else {
                  var img =
                      BlocProvider.of<SearchByImageCubit>(context).pickedImage!;

                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (builder) {
                      return ResultByImage(img);
                    },
                  ));
                }
              },
              icon: const Icon(
                Icons.search,
                size: 35,
              ),
            ),
            const Text(
              "Search",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        );
      },
    );
  }
}
