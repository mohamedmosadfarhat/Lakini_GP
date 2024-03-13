import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakini_gp/core/utils/styles.dart';
import 'package:lakini_gp/features/home/presentation/views/wedgits/menue.dart';
import 'package:lakini_gp/features/posts/presentation/manager/cubit/post_cubit/app_cubit.dart';
import 'package:lakini_gp/features/posts/presentation/manager/cubit/post_cubit/app_state.dart';
import 'package:lakini_gp/features/profile/presentation/views/edit_profile.dart';
import 'package:lakini_gp/features/profile/presentation/views/terms_and_conditions_screen.dart';
import 'package:lakini_gp/features/profile/widgets/custom_alert_dialog.dart';
import 'package:lakini_gp/features/profile/widgets/custom_menu_item.dart';
import 'package:lakini_gp/features/register/presentation/views/login_screen.dart';

import '../../../notifications/presentation/widgets/separator.dart';
import '../../../register/helper/cache_helper.dart';
import '../../../register/presentation/views/forget_password_screen.dart';

class ProfileMenu extends StatefulWidget {
  const ProfileMenu({super.key});

  static const String id = 'Profile Menu';

  @override
  State<ProfileMenu> createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(listener: (context, state) {
      if (state is DeleteProfileSuccessState) {
        buildSnackBar(
            context: context,
            text: state.delete.message,
            clr: const Color(0xff011730));
        CacheHelper.removeData(key: "userId");
        CacheHelper.removeData(key: "token").then((value) {
          if (value!) {
            Navigator.pushReplacementNamed(context, LoginScreen.id);
          }
        });
      }
    }, builder: (context, state) {
      var cubit = AppCubit.get(context);
      return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(1, 23, 48, 1),
                Color.fromRGBO(1, 23, 48, 1),
                Color.fromRGBO(0, 7, 15, 1),
                Color.fromRGBO(0, 7, 15, 1),
                Color.fromRGBO(0, 2, 5, 1),
                Color.fromRGBO(1, 23, 48, 1),
              ]),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(
                  Icons.search,
                  size: 30,
                ),
              ),
            ],
          ),
          drawer: const Menue(),
          body: Center(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      backgroundColor: mainColor,
                      radius: 66,
                      backgroundImage: NetworkImage(
                          "https://wdw888lb-7075.uks1.devtunnels.ms/resources/${cubit.profile.accountPhoto}"),
                    ),
                    const CircleAvatar(
                      backgroundColor: Color.fromRGBO(0, 34, 71, 1),
                      child: Icon(
                        Icons.edit_outlined,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    cubit.profile.userName,
                    style: Styles.textStyle20.copyWith(color: Colors.white),
                  ),
                ),
                Text(
                  cubit.profile.email,
                  style: Styles.textStyle14.copyWith(color: Colors.grey),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: mainColor,
                    ),
                    Text(
                      "${cubit.profile.city},${cubit.profile.region}",
                      style: Styles.textStyle14.copyWith(
                          color: const Color(0xffF3F3F3),
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                const Seprator(),
                const SizedBox(
                  height: 14,
                ),
                Column(
                  children: [
                    CustomMenuItem(
                      title: 'Terms and Conditions',
                      prefixIcon: Icons.image_outlined,
                      postIcon: Icons.arrow_forward_ios,
                      prefixIconColor: const Color.fromRGBO(29, 36, 202, 1),
                      onTab: () {
                        Navigator.pushNamed(
                            context, TermsAndConditionScreen.id);
                      },
                    ),
                    CustomMenuItem(
                      title: 'Activities',
                      prefixIcon: Icons.person_search_outlined,
                      postIcon: Icons.arrow_forward_ios,
                      prefixIconColor: const Color.fromARGB(255, 57, 69, 114),
                      onTab: () {},
                    ),
                    CustomMenuItem(
                      title: 'Help',
                      prefixIcon: Icons.support,
                      postIcon: Icons.arrow_forward_ios,
                      prefixIconColor: const Color.fromRGBO(1, 41, 87, 1),
                      onTab: () {},
                    ),
                    CustomMenuItem(
                      title: 'Settings',
                      prefixIcon: Icons.settings_suggest_outlined,
                      postIcon: Icons.arrow_forward_ios,
                      prefixIconColor: const Color.fromARGB(255, 173, 139, 81),
                      onTab: () {
                        Navigator.pushNamed(context, EditProfileScreen.id);
                      },
                    ),
                    CustomMenuItem(
                      title: 'Change Password',
                      prefixIcon: Icons.password_outlined,
                      postIcon: Icons.arrow_forward_ios,
                      prefixIconColor: const Color.fromARGB(255, 70, 1, 7),
                      onTab: () {
                        Navigator.pushNamed(
                          context,
                          ForgetPasswordScreen.fpId,
                        );
                      },
                    ),
                    CustomMenuItem(
                      title: 'Delete Account',
                      prefixIcon: Icons.person_remove_alt_1_outlined,
                      prefixIconColor: const Color(0xffEA4335),
                      onTab: () => buildDialog(
                          context: context,
                          title: 'Delete Account',
                          message: 'Are You Sure You Want To Delete Account?',
                          function: cubit.deleteProfile,
                          order: 'Delete'),
                    ),
                    CustomMenuItem(
                      title: 'Logout',
                      prefixIcon: Icons.logout_outlined,
                      prefixIconColor: const Color(0xffEA4335),
                      onTab: () => buildDialog(
                          context: context,
                          title: 'Logout',
                          message: 'Are You Sure You Want To Logout?',
                          function: () {
                            CacheHelper.removeData(key: "userId");
                            CacheHelper.removeData(key: "token").then((value) {
                              if (value!) {
                                Navigator.pushNamed(context, LoginScreen.id);
                              }
                            });
                          },
                          order: 'Logout'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
