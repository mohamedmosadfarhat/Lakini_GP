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
  final GlobalKey<FormState> _formKey = GlobalKey();
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
        if (state is AppConfirmSuccessState ) {
          if (state.confirmModel.status ) {
            print(state.confirmModel.message);
            buildSnackBar(
                context: context,
                text: state.confirmModel.message,
                clr: const Color(0xff011730));
            Navigator.pushNamed(context, LoginScreen.id);
          } else {
            buildSnackBar(
                context: context,
                text: state.confirmModel.message,
                clr: const Color.fromARGB(255, 92, 1, 1));
          }
        }
        if (state is AppReconfirmSuccessState ) {
          if (state.reConfirmModel.status ) {
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
                child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.08),
                        Center(
                          child: Image.asset(
                            "assets/otp.png",
                            height: height * 0.25,
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
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Empty Field!";
                              }
                              return null;
                            },
                            controller: usernameController,
                          ),
                        SizedBox(height: height * 0.03),
                        OtpVerificationRow(
                          txtController: txtControllers,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Empty Field!";
                            }
                            return null;
                          },
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
                        if (state is AppConfirmLoadingState)
                          const LinearProgressIndicator(
                            color: Color.fromRGBO(1, 54, 115, 1),
                          ),
                        SizedBox(height: height * 0.02),
                        MyButton(
                          label: 'Verify',
                          onTap: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                           
                              cubit.userConfirm(
                                userName: usernameController.text.toString(),
                                code:
                                    "${txtController1.text}${txtController2.text}${txtController3.text}${txtController4.text}${txtController5.text}${txtController6.text}",
                              );
                            
                          },
                        )
                      ]),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
