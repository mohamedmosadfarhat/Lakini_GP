import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakini_gp/features/register/presentation/login_cubit/login_cubit.dart';
import 'package:lakini_gp/features/register/presentation/login_cubit/login_state.dart';
import 'package:lakini_gp/features/register/presentation/views/create_password_screen.dart';
import 'package:lakini_gp/features/register/validation.dart';


import '../../../../core/utils/styles.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/input_field.dart';
import 'login_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String fpId = "ForgetPasswordId";
  ForgetPasswordScreen({super.key});
  
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocConsumer<AppLoginCubit, AppLoginState>(
      listener: (context, state) {
        if (state is AppForgotPasswordSuccessState ) {
          if (state.forgotPasswordModel.status ) {
            print(state.forgotPasswordModel.message);
            buildSnackBar(
                context: context,
                text: state.forgotPasswordModel.message,
                clr: const Color(0xff011730));
                 Navigator.pushNamed(context, CreatePasswordScreen.cpId);
           
          } else {
            buildSnackBar(
                context: context,
                text: state.forgotPasswordModel.message,
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
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/pass.png",
                          height: height * 0.15,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: height*0.03,),
                        Text(
                          "Forget Password?",
                          style: Styles.textStyle60.copyWith(fontSize: 28),
                        ),
                        SizedBox(height: height*0.03,),
                        Text(
                          "Don’t worry! It occurs Please enter the email address Linked with your account.",
                          style: Styles.textStyle14,
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical:16.0),
                          child: InputField(
                            title: 'Email',
                            hint: 'Enter Your Email',
                            widget: const Icon(
                              Icons.mail_outline,
                              color: Colors.grey,
                            ),
                            textType: TextInputType.emailAddress,
                            controller: emailController,
                          ),
                        ),
                       
                        state is AppForgotPasswordLoadingState?
                        Center(child: Image.asset("assets/loadinBall.gif",height: height*0.13,width: width*0.13,),):
                        MyButton(
                          label: 'Send Code',
                          onTap: () {
                           if (!emailController.text.contains("@") ||
                              !emailController.text.isValidEmail||
                                  !emailController.text.contains(".com")) {
                                buildSnackBar(
                                    context: context,
                                    text: "Invalid email address",
                                    clr: const Color.fromARGB(255, 92, 1, 1));
                              }
                            else{
                              cubit.userforgotPassword(
                                email: emailController.text.toString());
                            }
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
