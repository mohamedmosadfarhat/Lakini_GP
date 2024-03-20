import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakini_gp/features/register/presentation/login_cubit/login_cubit.dart';

import 'package:lakini_gp/features/register/presentation/views/login_screen.dart';

import '../../../../core/utils/styles.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/input_field.dart';
import '../../widgets/otp_txt_field.dart';
import '../login_cubit/login_state.dart';

class OtpVerification extends StatelessWidget {
  static const String otp = "OTPScreen";
  OtpVerification({super.key});

  final TextEditingController txtController1 = TextEditingController();
  final TextEditingController txtController2 = TextEditingController();
  final TextEditingController txtController3 = TextEditingController();
  final TextEditingController txtController4 = TextEditingController();
  final TextEditingController txtController5 = TextEditingController();
  final TextEditingController txtController6 = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final String? email = routeArg["email"];
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<TextEditingController> txtControllers = [
      txtController1,
      txtController2,
      txtController3,
      txtController4,
      txtController5,
      txtController6,
    ];
    return BlocConsumer<AppLoginCubit, AppLoginState>(
      listener: (context, state) {
        if (state is AppConfirmSuccessState) {
          if (state.confirmModel.status) {
            print(state.confirmModel.message);
            buildSnackBar(
                context: context,
                text: state.confirmModel.message,
                clr: const Color(0xff011730));
            Navigator.pushReplacementNamed(context, LoginScreen.id);
          } else {
            buildSnackBar(
                context: context,
                text: state.confirmModel.message,
                clr: const Color.fromARGB(255, 92, 1, 1));
          }
        }
        if (state is AppReconfirmSuccessState) {
          if (state.reConfirmModel.status) {
            print(state.reConfirmModel.message);
            buildSnackBar(
                context: context,
                text: state.reConfirmModel.message,
                clr: const Color(0xff011730));
          } else {
            buildSnackBar(
                context: context,
                text: state.reConfirmModel.message,
                clr: const Color.fromARGB(255, 92, 1, 1));
          }
        }
      },
      builder: (context, state) {
        var cubit = AppLoginCubit.get(context);
        //usernameController.text = userName!;
        return Scaffold(
          body: Container(
            height: double.infinity,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.08),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                          "assets/otp.png",
                          height: height * 0.2,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      Text(
                        "OTP Verification",
                        style: Styles.textStyle60.copyWith(fontSize: 28),
                      ),
                      SizedBox(height: height * 0.01),
                      Text(
                        "Enter the verification code we just sent on your email address.",
                        style: Styles.textStyle14,
                      ),
                      SizedBox(height: height * 0.03),
                      InputField(
                        title: 'UserName',
                        hint: 'Please Enter Your Email',
                        controller: usernameController,
                      ),
                      SizedBox(height: height * 0.03),
                      OtpVerificationRow(
                        txtController: txtControllers,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                            onPressed: () {
                              print(email);
                              cubit.userReconfirm(email: email!);
                            },
                            child: Text(
                              "Resend Code?",
                              style: Styles.textStyle14.copyWith(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline),
                            )),
                      ),
                    SizedBox(height: height * 0.02),
                    state is AppConfirmLoadingState||state is AppReconfirmLoadingState?
                        Center(child: Image.asset("assets/loadinBall.gif",height: height*0.13,width: width*0.13,),):
                      MyButton(
                        label: 'Verify',
                        onTap: () {
                          if (usernameController.text.isEmpty ||
                              txtController1.text.isEmpty ||
                              txtController2.text.isEmpty ||
                              txtController3.text.isEmpty ||
                              txtController4.text.isEmpty ||
                              txtController5.text.isEmpty ||
                              txtController6.text.isEmpty) {
                            buildSnackBar(
                                context: context,
                                text: "Please Fill All Fields!",
                                clr: const Color.fromARGB(255, 92, 1, 1));
                          }
                          else{
                            cubit.userConfirm(
                            userName: usernameController.text.toString(),
                            code:
                                "${txtController1.text}${txtController2.text}${txtController3.text}${txtController4.text}${txtController5.text}${txtController6.text}",
                          );
                          }
                        },
                      )
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
