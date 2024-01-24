import 'package:flutter/material.dart';
import 'package:lakini_gp/core/utils/styles.dart';
import 'package:lakini_gp/features/register/presentation/views/login_screen.dart';
import 'package:lakini_gp/features/register/validation.dart';
import 'package:lakini_gp/features/register/widgets/custom_auth_button.dart';

import 'package:lakini_gp/features/register/widgets/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static String id = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 45,
                  ),
                  Image.asset('assets/icon.png'),
                  const Text(
                    'Register',
                    style: Styles.textStyle30,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
                        style: Styles.textStyle18,
                      ),
                      CustomTextField(
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
                      CustomTextField(
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
                      CustomTextField(
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
                      CustomTextField(
                        icon: Icons.lock_outline,
                        hintText: 'Enter password',
                        isPassword: true,
                        textController: passwordController,
                        validator: (String? value) {
                          if (value!.isEmpty || !value.isValidPassword) {
                            return 'Password should be at least 8 characters and include \n'
                                'at least one uppercase letter,digit, and special character.';
                          }
                          return null;
                        },
                      ),
                      Text(
                        'Confirm Password',
                        style: Styles.textStyle18,
                      ),
                      CustomTextField(
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
                            if (!formKey.currentState!.validate()) {
                              return;
                            }
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            LoginScreen.id,
                          );
                        },
                        child: Text(
                          'Log in',
                          style: Styles.textStyle14.copyWith(color: mainColor),
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
  }
}
