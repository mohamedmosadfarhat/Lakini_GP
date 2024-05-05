import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakini_gp/features/home/presentation/views/wedgits/custom_loading_indicator.dart';
import 'package:lakini_gp/features/posts/presentation/manager/cubit/cubit/generate_image_cubit.dart';
import 'package:lakini_gp/features/posts/presentation/widgets/add_image_container.dart';
import 'package:lakini_gp/features/posts/presentation/widgets/custom_error_widget.dart';
import 'package:lakini_gp/features/posts/presentation/widgets/post_body_widget.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

int activePage = 1;

class _ImageSliderState extends State<ImageSlider> {
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenerateImageCubit, GenerateImageState>(
      builder: (context, state) {
        if (state is GenerateImageSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 360,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: state.images.length,
                  pageSnapping: true,
                  onPageChanged: (page) {
                    setState(() {
                      activePage = page;
                    });
                  },
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        generatedData = state.images[index].toString();
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: const Color(0xff6D83EA),
                            )),
                        margin: const EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            state.images[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicators(
                  state.images.length,
                  activePage,
                ),
              ),
            ],
          );
        } else if (state is GenerateImageFailure) {
          return CustomErrorWidget(
            errText: state.errorMessage,
          );

          // showSnackBarMessage(context, state.errorMessage);
        } else if (state is GenerateImageLoading) {
          return const Center(child: CustomLoadingIndicator());
        } else {
          return const Text('Opps! try Again!');
        }
      },
    );
  }
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: currentIndex == index ? Color(0xff6D83EA) : Colors.grey,
          shape: BoxShape.circle),
    );
  });
}

AnimatedContainer slider(images, pagePosition, active) {
  double margin = active ? 10 : 20;
  return AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(images[pagePosition]))),
  );
}
