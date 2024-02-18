import 'package:flutter/material.dart';
import 'package:lakini_gp/features/Ai%20/presentation/views/searching_with_ai.dart';
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
import 'features/home/item_details/presentation/views/home_screen.dart';
import 'features/home/item_details/screen/item_details_screen.dart';
import 'features/register/presentation/views/forget_password_screen.dart';
import 'features/register/presentation/views/otp_verification_screen.dart';
import 'features/splash/presentation/views/splash_screen.dart';

void main() {
  runApp(const Lakini());
}

class Lakini extends StatelessWidget {
  const Lakini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        ForgetPasswordScreen.fpId: (_) => ForgetPasswordScreen(),
        OtpVerification.otp: (_) => OtpVerification(),
        CreatePasswordScreen.cpId: (_) => CreatePasswordScreen(),
        LoginScreen.id: (_) => const LoginScreen(),
        RegisterScreen.id: (_) => const RegisterScreen(),
        SplashScreen.id: (_) => const SplashScreen(),
        OnBoardingScreen.id: (_) => const OnBoardingScreen(),
        HomeScreen.id: (_) => const HomeScreen(),
        EditProfileScreen.id: (_) => const EditProfileScreen(),
        ProfileMenu.id: (_) => const ProfileMenu(),
        TermsAndConditionScreen.id: (_) => const TermsAndConditionScreen(),
        ChatContent.id: (context) => ChatContent(),
        SearchingWithAi.id: (context) => SearchingWithAi(),
        ItemDetails.itemId: (_) => const ItemDetails(),
        AddPostScreen.id: (_) => const AddPostScreen(),
        PostAddedSuccessScreen.id: (_) => const PostAddedSuccessScreen(),
      },
    );
  }
}
