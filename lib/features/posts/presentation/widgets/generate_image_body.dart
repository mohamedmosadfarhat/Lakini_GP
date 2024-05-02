import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakini_gp/core/utils/styles.dart';
import 'package:lakini_gp/features/posts/presentation/manager/cubit/cubit/generate_image_cubit.dart';
import 'package:lakini_gp/features/posts/presentation/widgets/image_slider.dart';

class GenerateImageBody extends StatefulWidget {
  const GenerateImageBody({super.key});

  @override
  State<GenerateImageBody> createState() => _GenerateImageBodyState();
}

class _GenerateImageBodyState extends State<GenerateImageBody> {
  late TextEditingController textEditingController;

  bool isActive = false;
  bool _showSlider = false;
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();

    textEditingController.addListener(() {
      final hasText = textEditingController.text.isNotEmpty;

      setState(() {
        isActive = hasText;
      });
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 46,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Search for image',
              style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Search for an image using Generative AI by describing what you want to see and\n it could generate image too.',
              style: Styles.textStyle14.copyWith(
                color: Colors.white.withOpacity(0.6),
              ),
            ),
            const SizedBox(
              height: 19,
            ),
            TextField(
              controller: textEditingController,
              maxLines: 2,
              decoration: InputDecoration(
                hintText: 'Add a description for the image',
                hintStyle: Styles.textStyle14,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xff08B5FF),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Ink(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff6D83EA),
                    Color(0xff08B5FF),
                  ],
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: SizedBox(
                child: ElevatedButton(
                  style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.resolveWith<Size>((states) {
                      return Size(200, isActive ? 50 : 50);
                    }),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.black.withOpacity(0.8);
                        }
                        return Colors.transparent;
                      },
                    ),
                    foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      },
                    ),
                    elevation: MaterialStateProperty.resolveWith<double>(
                      (Set<MaterialState> states) {
                        return 0;
                      },
                    ),
                  ),
                  onPressed: isActive
                      ? () {
                          setState(() {
                            BlocProvider.of<GenerateImageCubit>(context)
                                .fetchImage(text: textEditingController.text);
                          });
                          setState(() {
                            _showSlider = true;
                            isActive = false;
                          });
                        }
                      : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/gears.png',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Generate',
                        style: Styles.textStyle16.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(visible: _showSlider, child: const ImageSlider()),
          ],
        ),
      ),
    );
  }
}
