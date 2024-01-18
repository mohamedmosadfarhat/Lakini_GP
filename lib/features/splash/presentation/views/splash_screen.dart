import 'package:flutter/material.dart';
import 'package:lakini/core/utils/styles.dart';
import 'package:page_transition/page_transition.dart';

import '../../../onboarding/presentation/views/onboarding_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String imageUrl = "assets/loading.gif";
  double _iconPosition = -200;
  double _position = -200;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startAnimation();

      Future.delayed(const Duration(seconds: 4), () {
        setState(() {
          imageUrl = "assets/Next.png";
        });
      });
    });
  }

  void startAnimation() {
    setState(() {
      _iconPosition = MediaQuery.of(context).size.height / 2 -
          100; 
      _position = MediaQuery.of(context).size.width / 2 -120; 
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(seconds: 3),
                    curve: Curves.easeInOutCirc,
                    bottom: _iconPosition,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: width*0.38,
                        ),
                        Image.asset("assets/icon.png",height: 120),
                         SizedBox(
                          width: width*0.07,
                        ),
                       
                      ],
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(seconds: 3),
                    curve: Curves.easeInOutExpo,
                    right: _position,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         SizedBox(
                          height: height*0.47,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Lakini",style: Styles.textStyle60,),
                                Text("Lost And Founds",style: Styles.textStyle60,),
                              ],
                            ),
                             SizedBox(
                              width: width*0.05,
                            ),
      
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
           GestureDetector(
             onTap: (){
               Navigator.pushReplacement(
                   context,
                   PageTransition(
                     child: const OnBoardingScreen(),
                     type: PageTransitionType.rightToLeft,
                     curve: Curves.easeIn,
                     duration: const Duration(milliseconds: 700),
                   ));
             },
             child: Image.asset(
               imageUrl,
                    height: height*0.1,
                  ),
           ),
           SizedBox(height: height*0.03,)
        ],
      ),
    );
  }
}
