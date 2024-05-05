import 'package:flutter/material.dart';
import 'package:lakini_gp/core/utils/styles.dart';
import 'package:lakini_gp/features/home/presentation/views/home_screen.dart';
import 'package:lakini_gp/features/register/widgets/custom_auth_button.dart';

class PostAddedSuccessScreen extends StatelessWidget {
  const PostAddedSuccessScreen({Key? key}) : super(key: key);
  static const String id = 'PostAdded';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/checked.png'),
              SizedBox(
                height: height * 0.03,
              ),
              Text(
                'Your post has been published \n '
                'successfully!!',
                style: Styles.textStyle18,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: height * 0.09,
              ),
              CustomRegisterButton(
                  text: 'Home',
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, HomeScreen.id);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
