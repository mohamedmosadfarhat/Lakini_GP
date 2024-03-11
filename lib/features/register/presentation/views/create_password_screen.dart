import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakini_gp/features/register/presentation/login_cubit/login_cubit.dart';

import 'package:lakini_gp/features/register/validation.dart';

import '../../../../core/utils/styles.dart';
import '../../helper/cache_helper.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/input_field.dart';
import '../login_cubit/login_state.dart';
import 'login_screen.dart';

class CreatePasswordScreen extends StatelessWidget {
  static const String cpId = "CreatePasswordId";
  CreatePasswordScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController tokenController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return BlocConsumer<AppLoginCubit, AppLoginState>(
      listener: (context, state) {
        if (state is AppSetPasswordSuccessState) {
          if (state.setPasswordModel.status) {
            print(state.setPasswordModel.message);
            buildSnackBar(
                context: context,
                text: state.setPasswordModel.message,
                clr: const Color(0xff011730));
            CacheHelper.removeData(key: "userId");
            CacheHelper.removeData(key: "token").then((value) {
              if (value!) {
                Navigator.pushReplacementNamed(context, LoginScreen.id);
              }
            });
          } else {
            buildSnackBar(
                context: context,
                text: state.setPasswordModel.message,
                clr: const Color.fromARGB(255, 92, 1, 1));
          }
        }
      },
      builder: (context, state) {
        var cubit = AppLoginCubit.get(context);
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Create new password",
                            style: Styles.textStyle60.copyWith(fontSize: 28),
                          ),
                          Text(
                            "Please take the token that had sent to you on your G-mail and put it here ",
                            style: Styles.textStyle14,
                          ),
                          InputField(
                            title: 'Token',
                            hint: 'Enter Your Token',
                            controller: tokenController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Required Field!";
                              }
                              return null;
                            },
                          ),
                          InputField(
                            title: 'Email',
                            hint: 'Enter Your Email',
                            widget: const Icon(
                              Icons.mail_outline,
                              color: Colors.grey,
                            ),
                            textType: TextInputType.emailAddress,
                            controller: emailController,
                            validator: (val) {
                              if (val!.isEmpty || !val.contains("@")) {
                                return "Invalid E_Mail!";
                              }
                              return null;
                            },
                          ),
                          InputField(
                            title: 'New Password',
                            hint: 'Enter Password',
                            widget: const Icon(
                              Icons.lock_outline,
                              color: Colors.grey,
                            ),
                            textType: TextInputType.visiblePassword,
                            controller: passwordController,
                          ),
                          InputField(
                              title: 'Confirm Password',
                              hint: 'Enter Confirm Password',
                              widget: const Icon(
                                Icons.lock_outline,
                                color: Colors.grey,
                              ),
                              textType: TextInputType.visiblePassword,
                              controller: confirmPasswordController,
                              validator: (value) {
                                if (value != passwordController.text) {
                                  return "Password Don't Match!";
                                }
                                return null;
                              }),
                          SizedBox(height: height * 0.03),
                          MyButton(
                            label: 'Set Password',
                            onTap: () {
                              if (tokenController.text.isEmpty) {
                                buildSnackBar(
                                    context: context,
                                    text: "Required Field",
                                    clr: const Color.fromARGB(255, 92, 1, 1));
                              } else if (!emailController.text.contains("@") ||
                                  !emailController.text.contains(".com")) {
                                buildSnackBar(
                                    context: context,
                                    text: "Invalid email address",
                                    clr: const Color.fromARGB(255, 92, 1, 1));
                              } else if (passwordController.text.length < 8) {
                                buildSnackBar(
                                    context: context,
                                    text:
                                        "Password must be at least 8 and maximum 50 characters.",
                                    clr: const Color.fromARGB(255, 92, 1, 1));
                              } else if (!passwordController
                                  .text.isValidPassword) {
                                buildSnackBar(
                                    context: context,
                                    text:
                                        "Passwords must have at least one non alphanumeric character,at least one digit ('0'-'9'),at least one uppercase ('A'-'Z').",
                                    clr: const Color.fromARGB(255, 92, 1, 1));
                              } else if (passwordController.text !=
                                  confirmPasswordController.text) {
                                buildSnackBar(
                                    context: context,
                                    text: "Password Dosen't Match",
                                    clr: const Color.fromARGB(255, 92, 1, 1));
                              } else {
                                cubit.usersetPassword(
                                  myToken: tokenController.text.toString(),
                                  email: emailController.text.toString(),
                                  password:
                                      confirmPasswordController.text.toString(),
                                );
                              }
                            },
                          ),
                          if (state is AppSetPasswordLoadingState)
                            const LinearProgressIndicator(
                              color: Color.fromRGBO(1, 23, 48, 1),
                            ),
                        ]),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
