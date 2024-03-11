import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lakini_gp/core/utils/assets.dart';
import 'package:lakini_gp/core/utils/styles.dart';
import 'package:lakini_gp/features/posts/presentation/manager/cubit/post_cubit/app_cubit.dart';
import 'package:lakini_gp/features/posts/presentation/manager/cubit/post_cubit/app_state.dart';
import 'package:lakini_gp/features/profile/presentation/views/profile_menu.dart';
import 'package:lakini_gp/features/register/presentation/views/login_screen.dart';
import 'package:lakini_gp/features/register/validation.dart';
import 'package:lakini_gp/features/register/widgets/custom_auth_button.dart';
import 'package:lakini_gp/features/register/widgets/custom_text_form_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});
  static const String id = 'editProfile';

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is GetProfileSuccessState) {
          buildSnackBar(
              context: context,
              text: "your account has been updated",
              clr: const Color(0xff011730));
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        usernameController.text = cubit.profile.userName;
        emailController.text = cubit.profile.email;
        cityController.text = cubit.profile.city;
        regionController.text = cubit.profile.region;
        phoneController.text = cubit.profile.phone;
        return Scaffold(
          appBar: AppBar(
            elevation: 2,
            backgroundColor: const Color.fromARGB(255, 0, 14, 24),
            automaticallyImplyLeading: true,
            centerTitle: true,
            title: Text(
              'Edit profile',
              style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          body: Container(
            height: double.infinity,
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
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Center(
                        child: Stack(
                          children: [
                           cubit.profileImage != null?
                           CircleAvatar(radius: 66,backgroundImage: FileImage(cubit.profileImage!),)
                            :CircleAvatar(
                              radius: 66,
                              backgroundImage: NetworkImage(
                                      "https://wdw888lb-7075.uks1.devtunnels.ms/resources/${cubit.profile.accountPhoto}"),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 17,
                                backgroundColor: Colors.black.withOpacity(0.4),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: cubit.fetchProfileImage,
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
                    ),
                    Text(
                      'Username',
                      style: Styles.textStyle18,
                    ),
                    CustomTextFormField(
                      icon: Icons.person,
                      hintText: cubit.profile.userName,
                      textController: usernameController,
                      validator: (String? value) {},
                    ),
                    Text(
                      'Email',
                      style: Styles.textStyle18,
                    ),
                    CustomTextFormField(
                      icon: Icons.email_outlined,
                      textController: emailController,
                      hintText: cubit.profile.email,
                      validator: (String? value) {},
                    ),
                    Text(
                      'City',
                      style: Styles.textStyle18,
                    ),
                    CustomTextFormField(
                      icon: Icons.location_on_outlined,
                      hintText: cubit.profile.city,
                      validator: (String? value) {},
                      textController: cityController,
                    ),
                    Text(
                      'Region',
                      style: Styles.textStyle18,
                    ),
                    CustomTextFormField(
                      icon: Icons.location_on_outlined,
                      hintText: cubit.profile.region,
                      validator: (String? value) {},
                      textController: regionController,
                    ),
                    Text(
                      'Phone',
                      style: Styles.textStyle18,
                    ),
                    CustomTextFormField(
                      icon: Icons.phone,
                      hintText: cubit.profile.phone,
                      
                      textController: phoneController,
                      validator: (String? value) {},
                    ),
                    
                    const SizedBox(
                      height: 40,
                    ),
                    state is GetProfileLoadingState ||
                            state is UpdateProfileLoadingState
                        ? const Center(
                          child: CircularProgressIndicator(
                              color: mainColor,
                            ),
                        )
                        : CustomRegisterButton(
                            text: 'Save',
                            onPressed: () {
                              print(usernameController.text);
                              cubit.update(
                                UserName: usernameController.text,
                                Email: emailController.text,
                                City: cityController.text,
                                Region: regionController.text,
                                Phone: phoneController.text,
                              );
                            }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
