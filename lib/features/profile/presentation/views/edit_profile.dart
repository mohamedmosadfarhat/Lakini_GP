import 'package:flutter/material.dart';
import 'package:lakini_gp/core/utils/styles.dart';
import 'package:lakini_gp/features/register/validation.dart';
import 'package:lakini_gp/features/register/widgets/custom_auth_button.dart';
import 'package:lakini_gp/features/register/widgets/custom_textfield.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});
  static const String id = 'editProfile';

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          'Edit profile',
          style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Center(
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 66,
                        backgroundImage: AssetImage('assets/pfp.png'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 17,
                          backgroundColor: Colors.black.withOpacity(0.4),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
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
              CustomTextField(
                icon: Icons.person,
                hintText: 'Ahmed Sherif',
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
                hintText: 'ahmedalii12336@gmail.com',
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
                  hintText: 'Biala Kafr El_Sheikh ',
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
                  text: 'Save',
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
