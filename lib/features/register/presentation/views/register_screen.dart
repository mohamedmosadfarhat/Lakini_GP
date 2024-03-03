import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakini_gp/core/utils/styles.dart';
import 'package:lakini_gp/features/register/presentation/register_cubit/register_cubit.dart';
import 'package:lakini_gp/features/register/presentation/register_cubit/register_state.dart';
import 'package:lakini_gp/features/register/presentation/views/login_screen.dart';
import 'package:lakini_gp/features/register/validation.dart';
import 'package:lakini_gp/features/register/widgets/custom_auth_button.dart';
import 'package:lakini_gp/features/register/widgets/custom_text_form_field.dart';
import 'otp_verification_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static String id = 'RegisterScreen';

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final TextEditingController usernameController = TextEditingController();

    final TextEditingController locationController = TextEditingController();

    final TextEditingController emailController = TextEditingController();

    final TextEditingController passwordController = TextEditingController();

    final TextEditingController confirmPasswordController =
        TextEditingController();
    return BlocConsumer<AppRegisterCubit, AppRegisterState>(
      listener: (context, state) {
        if (state is AppRegisterSuccessState) {
          if (state.registerModel.status &&
              passwordController.text == confirmPasswordController.text) {
            print(state.registerModel.message);
            buildSnackBar(
                context: context,
                text: state.registerModel.message,
                clr: const Color(0xff011730));
            Navigator.pushNamed(
              context,
              OtpVerification.otp,
              arguments: {"email": emailController.text.toString()},
            );
          } else {
            buildSnackBar(
                context: context,
                text: state.registerModel.message,
                clr: const Color.fromARGB(255, 92, 1, 1));
          }
        }
      },
      builder: (context, state) {
        var cubit = AppRegisterCubit.get(context);
        return Container(
          height: MediaQuery.of(context).size.height,
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
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              automaticallyImplyLeading: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (state is AppRegisterLoadingState)
                        const LinearProgressIndicator(
                          color: Color.fromRGBO(1, 54, 115, 1),
                        ),
                      Image.asset('assets/icon.png'),
                      const Text(
                        'Register',
                        style: Styles.textStyle30,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Username',
                            style: Styles.textStyle18,
                          ),
                          CustomTextFormField(
                            icon: Icons.person,
                            hintText: 'Enter your name',
                            textController: usernameController,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please enter your username';
                              }
                              return null;
                            },
                          ),
                          Text(
                            'Email',
                            style: Styles.textStyle18,
                          ),
                          CustomTextFormField(
                            icon: Icons.email_outlined,
                            textController: emailController,
                            hintText: 'Enter your email',
                            validator: (String? value) {
                              if (value!.isEmpty || !value.isValidEmail) {
                                return 'Please enter valid Email';
                              }
                              return null;
                            },
                          ),
                          Text(
                            'Location',
                            style: Styles.textStyle18,
                          ),
                          CustomTextFormField(
                              icon: Icons.location_on_outlined,
                              hintText: 'Enter your Location',
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please enter location';
                                }
                                return null;
                              },
                              textController: locationController),
                          Text(
                            'Password',
                            style: Styles.textStyle18,
                          ),
                          CustomTextFormField(
                            icon: Icons.lock_outline,
                            hintText: 'Enter password',
                            isPassword: true,
                            textController: passwordController,
                            validator: (String? val) {
                              return null;
                            },
                          ),
                          Text(
                            'Confirm Password',
                            style: Styles.textStyle18,
                          ),
                          CustomTextFormField(
                            icon: Icons.lock_outline,
                            hintText: 'Confirm password',
                            isPassword: true,
                            textController: confirmPasswordController,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please confirm your password';
                              } else if (value != passwordController.text) {
                                return "Password Don't Match!";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          CustomRegisterButton(
                              text: 'Register',
                              onPressed: () {
                                if (usernameController.text.length < 6) {
                                  buildSnackBar(
                                      context: context,
                                      text:
                                          "Username must be at least 6 and maximum 50 characters.",
                                      clr: const Color.fromARGB(255, 92, 1, 1));
                                } else if (!emailController.text
                                        .contains("@") ||
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
                                  cubit.userRegister(
                                      city: locationController.text,
                                      userName: usernameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      region: "r",
                                      phone: "2");
                                }
                              }),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: Styles.textStyle16,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                LoginScreen.id,
                              );
                            },
                            child: Text(
                              'Log in',
                              style:
                                  Styles.textStyle14.copyWith(color: mainColor),
                            ),
                          )
                        ],
                      ),
                    ],
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
