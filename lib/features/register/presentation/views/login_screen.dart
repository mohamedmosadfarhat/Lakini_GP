import 'package:flutter/material.dart';
import 'package:lakini_gp/core/utils/styles.dart';
import 'package:lakini_gp/features/register/presentation/views/register_screen.dart';
import 'package:lakini_gp/features/register/validation.dart';
import 'package:lakini_gp/features/register/widgets/custom_auth_button.dart';
import 'package:lakini_gp/features/register/widgets/custom_text_form_field.dart';

import 'forget_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool value = false;

  static String id = 'LoginScreen';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
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
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: true,
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Image.asset('assets/icon.png'),
                  const Text(
                    'Login',
                    style: Styles.textStyle30,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: Styles.textStyle18,
                      ),
                      CustomTextFormField(
                        icon: Icons.email_outlined,
                        hintText: 'Enter your email',
                        textController: emailController,
                        validator: (String? val) {
                          if (val!.isEmpty || !val.isValidEmail) {
                            return "Invalid Email!";
                          }
                          return null;
                        },
                      ),
                      Text(
                        'Password',
                        style: Styles.textStyle18,
                      ),
                      CustomTextFormField(
                        icon: Icons.lock_outline,
                        hintText: 'Enter password',
                        textController: passwordController,
                        validator: (String? val) {
                          if (val!.isEmpty || !val.isValidPassword) {
                            return 'Please enter valid password';
                          }
                          return null;
                        },
                      ),
                      Row(
                        children: [
                          Checkbox(
                            activeColor: darkGreenColor,
                            checkColor: Colors.white,
                            value: value,
                            onChanged: (bool? value) {
                              setState(() {
                                this.value = value!;
                              });
                            },
                          ),
                          const Text('Remember me'),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, ForgetPasswordScreen.fpId);
                            },
                            child: Text(
                              'Forget Password?',
                              style: Styles.textStyle14.copyWith(
                                color: mainColor,
                                decoration: TextDecoration.underline,
                                decorationColor: mainColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomRegisterButton(
                        text: 'Login',
                        onPressed: () {
                          if (!formKey.currentState!.validate()) {
                            return;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            RegisterScreen.id,
                          );
                        },
                        child: Text(
                          'Register',
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
