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
    final TextEditingController usernameController = TextEditingController();

    final TextEditingController locationController = TextEditingController();

    final TextEditingController emailController = TextEditingController();
    final TextEditingController regionController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController idController = TextEditingController();

    final TextEditingController passwordController = TextEditingController();

    final TextEditingController confirmPasswordController =
        TextEditingController();
    return BlocProvider(
      create: (context) => AppRegisterCubit(),
      child: BlocConsumer<AppRegisterCubit, AppRegisterState>(
        listener: (context, state) {
          if (state is AppRegisterSuccessState) {
            if (state.status! &&
                passwordController.text == confirmPasswordController.text) {
              buildSnackBar(
                  context: context,
                  text: state.message!,
                  clr: const Color(0xff011730));
              Navigator.pushReplacementNamed(
                context,
                OtpVerification.otp,
                arguments: {"email": emailController.text.toString()},
              );
            } else {
              buildSnackBar(
                  context: context,
                  text: state.message!,
                  clr: const Color.fromARGB(255, 92, 1, 1));
            }
          }
        },
        builder: (context, state) {
          var cubit = AppRegisterCubit.get(context);
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;
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
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Image.asset(
                      "assets/icon.png",
                      height: height * 0.09,
                      width: width * 0.09,
                    ),
                  ),
                ],
                title: Text("Register",
                    style: Styles.textStyle18.copyWith(fontSize: 22)),
                centerTitle: true,
                automaticallyImplyLeading: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            cubit.pickedImage != null
                                ? CircleAvatar(
                                    radius: 66,
                                    backgroundImage:
                                        FileImage(cubit.pickedImage!),
                                  )
                                : const CircleAvatar(
                                    radius: 66,
                                    backgroundImage: NetworkImage(
                                        "https://wdw888lb-7075.uks1.devtunnels.ms/resources/Anonymous-man.png"),
                                  ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 17,
                                backgroundColor: Colors.black.withOpacity(0.4),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: cubit.fetchImage,
                                  icon: const Icon(
                                    Icons.add_a_photo_outlined,
                                    size: 24,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
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
                          ),
                          Text(
                            'Email',
                            style: Styles.textStyle18,
                          ),
                          CustomTextFormField(
                            icon: Icons.email_outlined,
                            textController: emailController,
                            inputType: TextInputType.emailAddress,
                            hintText: 'Enter your email',
                          ),
                          Text(
                            'City',
                            style: Styles.textStyle18,
                          ),
                          CustomTextFormField(
                              icon: Icons.location_on_outlined,
                              hintText: 'Enter your Location',
                              textController: locationController),
                          Text(
                            'Region',
                            style: Styles.textStyle18,
                          ),
                          CustomTextFormField(
                              icon: Icons.location_on_outlined,
                              hintText: 'Enter your Location',
                              textController: regionController),
                          Text(
                            'Phone',
                            style: Styles.textStyle18,
                          ),
                          CustomTextFormField(
                              icon: Icons.location_on_outlined,
                              hintText: 'Enter your Phone Number',
                              inputType: TextInputType.phone,
                              textController: phoneController),
                          Text(
                            'Your ID Card Number',
                            style: Styles.textStyle18,
                          ),
                          CustomTextFormField(
                            icon: Icons.insert_drive_file,
                            hintText: 'Enter your ID Number',
                            inputType: TextInputType.phone,
                            textController: idController,
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
                          ),
                          state is AppRegisterLoadingState
                              ? Center(
                                  child: Image.asset(
                                    "assets/loadinBall.gif",
                                    height: height * 0.13,
                                    width: width * 0.13,
                                  ),
                                )
                              : CustomRegisterButton(
                                  text: 'Register',
                                  onPressed: () {
                                    if (usernameController.text.length < 6) {
                                      buildSnackBar(
                                          context: context,
                                          text:
                                              "Username must be at least 6 and maximum 50 characters.",
                                          clr: const Color.fromARGB(
                                              255, 92, 1, 1));
                                    } else if (!emailController.text
                                            .contains("@") ||
                                        !emailController.text
                                            .contains(".com") ||
                                        !emailController.text.isValidEmail) {
                                      buildSnackBar(
                                          context: context,
                                          text: "Invalid email address",
                                          clr: const Color.fromARGB(
                                              255, 92, 1, 1));
                                    } else if (!idController.text.isValidID ||
                                        idController.text.isEmpty) {
                                      buildSnackBar(
                                          context: context,
                                          text: "Invalid Id Card Number",
                                          clr: const Color.fromARGB(
                                              255, 92, 1, 1));
                                    } else if (regionController.text.isEmpty ||
                                        locationController.text.isEmpty) {
                                      buildSnackBar(
                                          context: context,
                                          text: "Enter Your Region And City",
                                          clr: const Color.fromARGB(
                                              255, 92, 1, 1));
                                    } else if (phoneController.text.isEmpty) {
                                      buildSnackBar(
                                          context: context,
                                          text: "Enter Your Phone Number",
                                          clr: const Color.fromARGB(
                                              255, 92, 1, 1));
                                    } else if (passwordController.text.length <
                                        8) {
                                      buildSnackBar(
                                          context: context,
                                          text:
                                              "Password must be at least 8 and maximum 50 characters.",
                                          clr: const Color.fromARGB(
                                              255, 92, 1, 1));
                                    } else if (!passwordController
                                        .text.isValidPassword) {
                                      buildSnackBar(
                                          context: context,
                                          text:
                                              "Passwords must have at least one non alphanumeric character,at least one digit ('0'-'9'),at least one uppercase ('A'-'Z').",
                                          clr: const Color.fromARGB(
                                              255, 92, 1, 1));
                                    } else if (passwordController.text !=
                                        confirmPasswordController.text) {
                                      buildSnackBar(
                                          context: context,
                                          text: "Password Dosen't Match",
                                          clr: const Color.fromARGB(
                                              255, 92, 1, 1));
                                    } else if (cubit.pickedImage == null) {
                                      buildSnackBar(
                                          context: context,
                                          text:
                                              "Please Set Your Profile Picture",
                                          clr: const Color.fromARGB(
                                              255, 92, 1, 1));
                                    } else {
                                      cubit.userRegister(
                                          city: locationController.text,
                                          userName: usernameController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                          region: regionController.text,
                                          phone: phoneController.text,
                                          IdCard: idController.text);
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
          );
        },
      ),
    );
  }
}
