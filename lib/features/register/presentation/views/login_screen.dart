import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakini_gp/core/utils/styles.dart';

import 'package:lakini_gp/features/home/presentation/views/home_screen.dart';

import 'package:lakini_gp/features/register/presentation/login_cubit/login_state.dart';
import 'package:lakini_gp/features/register/presentation/views/register_screen.dart';
import 'package:lakini_gp/features/register/validation.dart';
import 'package:lakini_gp/features/register/widgets/custom_auth_button.dart';
import 'package:lakini_gp/features/register/widgets/custom_text_form_field.dart';

import '../../helper/cache_helper.dart';
import '../../helper/end_point.dart';
import '../login_cubit/login_cubit.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLoginCubit, AppLoginState>(
      listener: (context, state) {
        if (state is AppLoginSuccessState) {
          if (state.loginModel.status) {
            print(state.loginModel.message);
            buildSnackBar(
                context: context,
                text: state.loginModel.message,
                clr: const Color(0xff011730));
            CacheHelper.saveData(key: "remeber_me", value: value);
            CacheHelper.saveData(key: "token", value: state.loginModel.token)
                .then((value) {
              token = CacheHelper.getData(key: "token");
              Navigator.pushNamed(context, HomeScreen.id);
            });
          } else {
            buildSnackBar(
                context: context,
                text: state.loginModel.message,
                clr: const Color.fromARGB(255, 92, 1, 1));
          }
        }
      },
      builder: (context, state) {
        var cubit = AppLoginCubit.get(context);
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
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Image.asset('assets/icon.png'),
                      Text(
                        'Login',
                        style: Styles.textStyle28
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Login to continue using the app',
                        style: Styles.textStyle14.copyWith(
                            fontWeight: FontWeight.w400, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 42,
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
                            isPassword: true,
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
                              Text(
                                'Remember me',
                                style: Styles.textStyle14
                                    .copyWith(color: Colors.white),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    ForgetPasswordScreen.fpId,
                                  );
                                },
                                child: Text(
                                  'Forget Password?',
                                  style: Styles.textStyle14.copyWith(
                                    color: mainColor,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w700,
                                    decorationColor: mainColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 26,
                          ),
                          CustomRegisterButton(
                            text: 'Login',
                            onPressed: () {
                              if (!emailController.text.contains("@") ||
                                  !emailController.text.contains(".com")) {
                                buildSnackBar(
                                    context: context,
                                    text: "Invalid email address",
                                    clr: const Color.fromARGB(255, 92, 1, 1));
                              } else {
                                cubit.userLogin(
                                    email: emailController.text,
                                    password: passwordController.text);
                                print(cubit.login);
                                if (cubit.login == true) {
                                  Navigator.pushNamed(context, HomeScreen.id);
                                }
                              }
                            },
                          ),
                          const SizedBox(
                            height: 28,
                          ),
                          if (state is AppLoginLoadingState)
                            const LinearProgressIndicator(
                              color: Color.fromRGBO(1, 23, 48, 1),
                            ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: Styles.textStyle14
                                .copyWith(color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                RegisterScreen.id,
                              );
                            },
                            child: Text(
                              'Register',
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

SnackBar buildSnackBar(
    {required BuildContext context, required String text, required Color clr}) {
  final snackBar = SnackBar(
    //padding: const EdgeInsets.all(0.0),
    //margin: const EdgeInsets.all(10),
    behavior: SnackBarBehavior.floating,
    elevation: 0,
    backgroundColor: clr,
    content: Text(
      text,
      style: Styles.textStyle16,
    ),
    action: SnackBarAction(
      label: '',
      onPressed: () {},
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  return snackBar;
}
