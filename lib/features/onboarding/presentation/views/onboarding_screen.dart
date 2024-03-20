import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lakini_gp/features/register/presentation/views/login_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/utils/styles.dart';
import '../../../register/helper/cache_helper.dart';
import '../onboarding_models/onboarding_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  static String id = 'SplashScreen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
   int _currentIndex = 0;
  final PageController _controller = PageController(initialPage: 0);

 late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel(); 
    _controller.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % myData.length;
        _controller.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutCubic,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
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
        ),
        child: Stack(
          children: [
            Builder(builder: (ctx1) {
              return PageView(
                controller: _controller,
                onPageChanged: (val) {
                  setState(() {
                    _currentIndex = val;
                  });
                },
                children: myData
                    .map((item) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: height * 0.1,
                              ),
                              Image.asset(
                                item.imageUrl,
                                height: height * 0.35,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                height: height * 0.06,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 32),
                                child: Text(item.description,
                                    textAlign: TextAlign.center,
                                    style: Styles.textStyle60),
                              ),
                              SizedBox(
                                height: height * 0.1,
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              );
            }),
            Builder(builder: (context) {
              return Positioned(
                right: width * 0.03,
                top: height * 0.05,
                child: GestureDetector(
                  onTap: () {
                    CacheHelper.saveData(key: "onBoarding", value: true)
                        .then((value) {
                      if (value == true) {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                              child: const LoginScreen(),
                              type: PageTransitionType.rightToLeft,
                              curve: Curves.easeIn,
                              duration: const Duration(milliseconds: 700),
                            ));
                      }
                    });
                  },
                  child: Text(
                    "SKIP",
                    style: Styles.textStyle60
                        .copyWith(decoration: TextDecoration.underline),
                  ),
                ),
              );
            }),
            Align(
              alignment: const Alignment(0, 0.85),
              child: SmoothPageIndicator(
                controller: _controller,
                count: myData.length,
                effect: const JumpingDotEffect(
                    verticalOffset: 20,
                    jumpScale: 1.6,
                    dotColor: Colors.white,
                    activeDotColor: Color.fromRGBO(1, 20, 165, 1),
                    dotWidth: 16,
                    dotHeight: 4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
