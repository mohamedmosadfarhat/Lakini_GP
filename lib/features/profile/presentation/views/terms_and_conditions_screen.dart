import 'package:flutter/material.dart';
import 'package:lakini_gp/core/utils/styles.dart';
import 'package:lakini_gp/features/profile/widgets/custom_terms_text.dart';

class TermsAndConditionScreen extends StatefulWidget {
  const TermsAndConditionScreen({super.key});
  static const String id = 'Terms Screen';
  @override
  State<TermsAndConditionScreen> createState() =>
      _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Terms and Conditions',
          style: Styles.textStyle20,
        ),
        centerTitle: true,
      ),
      body: Container(
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
          // ToDo: padding here is for the appBar (cannot apply the scaffold body color)
          padding: const EdgeInsets.only(
              top: 100.0, bottom: 50, left: 16, right: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomTermsTextContainer(
                    textColor: darkGreenColor,
                    title: 'Terms',
                    text:
                        'Torem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Ut diam quam, semper iaculis condimentum ac, vestibulum eu nisl. Torem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Ut diam quam, semper iaculis condimentum ac, vestibulum eu nisl.'),
                SizedBox(
                  height: height * 0.02,
                ),
                const CustomTermsTextContainer(
                  textColor: Color(0xffC92B27),
                  title: 'Conditions',
                  text:
                      'Torem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur.',
                ),
                Row(
                  children: [
                    const Text('I agree to the terms and conditions'),
                    const Spacer(),
                    Checkbox(
                      activeColor: darkGreenColor,
                      checkColor: Colors.white,
                      value: value,
                      onChanged: (bool? newValue) {
                        setState(() {
                          value = newValue!;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
