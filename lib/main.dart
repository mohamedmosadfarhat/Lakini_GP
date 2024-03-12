import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakini_gp/features/home/presentation/views/home_screen.dart';
import 'package:lakini_gp/features/home/presentation/views/item_details_screen.dart';
import 'package:lakini_gp/features/onboarding/presentation/views/onboarding_screen.dart';
import 'package:lakini_gp/features/posts/presentation/views/post_added.dart';
import 'package:lakini_gp/features/posts/presentation/views/post_screen.dart';
import 'package:lakini_gp/features/profile/presentation/views/edit_profile.dart';
import 'package:lakini_gp/features/profile/presentation/views/profile_menu.dart';
import 'package:lakini_gp/features/profile/presentation/views/terms_and_conditions_screen.dart';
import 'package:lakini_gp/features/register/presentation/views/login_screen.dart';
import 'package:lakini_gp/features/register/presentation/views/register_screen.dart';
import 'package:lakini_gp/features/register/presentation/views/create_password_screen.dart';
import 'features/chat/presentation/views/chat_content.dart';
import 'features/register/helper/cache_helper.dart';
import 'features/register/helper/dio_helper.dart';
import 'features/register/helper/end_point.dart';
import 'features/register/presentation/login_cubit/login_cubit.dart';
import 'features/register/presentation/register_cubit/register_cubit.dart';
import 'features/register/presentation/views/forget_password_screen.dart';
import 'features/register/presentation/views/otp_verification_screen.dart';
import 'features/splash/presentation/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool onBoarding = CacheHelper.getData(key: "onBoarding") ?? false;
  bool rememberMe = CacheHelper.getData(key: "remeber_me") ?? false;
  print(token);
  Widget widget;

  if (onBoarding) {
    token = CacheHelper.getData(key: "token");
    print(token);
    widget =
        token != null && rememberMe ? const HomeScreen() : const LoginScreen();
  } else {
    widget = const OnBoardingScreen();
  }
  runApp(Lakini(
    startWidget: widget,
  ));
}

class Lakini extends StatelessWidget {
  final Widget? startWidget;
  const Lakini({this.startWidget, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppRegisterCubit(),
        ),
        BlocProvider(
          create: (context) => AppLoginCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        //   home:   SplashScreen(navigator: startWidget!,),
        home: HomeScreen(),
        routes: {
          ForgetPasswordScreen.fpId: (_) => ForgetPasswordScreen(),
          OtpVerification.otp: (_) => OtpVerification(),
          CreatePasswordScreen.cpId: (_) => CreatePasswordScreen(),
          LoginScreen.id: (_) => const LoginScreen(),
          RegisterScreen.id: (_) => const RegisterScreen(),
          SplashScreen.id: (_) => SplashScreen(
                navigator: startWidget!,
              ),
          OnBoardingScreen.id: (_) => const OnBoardingScreen(),
          HomeScreen.id: (_) => const HomeScreen(),
          EditProfileScreen.id: (_) => const EditProfileScreen(),
          ProfileMenu.id: (_) => const ProfileMenu(),
          TermsAndConditionScreen.id: (_) => const TermsAndConditionScreen(),
          ChatContent.id: (context) => const ChatContent(),
          //SearchingWithAi.id: (context) => SearchingWithAi(),
          ItemDetails.itemId: (_) => const ItemDetails(),
          AddPostScreen.id: (_) => const AddPostScreen(),
          PostAddedSuccessScreen.id: (_) => const PostAddedSuccessScreen(),
        },
      ),
    );
  }
}
