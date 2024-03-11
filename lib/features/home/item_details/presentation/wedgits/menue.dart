import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lakini_gp/features/profile/widgets/custom_menu_item.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../posts/presentation/manager/cubit/post_cubit/app_cubit.dart';
import '../../../../posts/presentation/manager/cubit/post_cubit/app_state.dart';
import '../../../../profile/widgets/custom_alert_dialog.dart';
import '../../../../register/helper/cache_helper.dart';
import '../../../../register/presentation/views/login_screen.dart';

class Menue extends StatefulWidget {
  const Menue({Key? key}) : super(key: key);

  @override
  State<Menue> createState() => _MenueState();
}

class _MenueState extends State<Menue> {
  bool notificationValue = false;
  bool themeValue = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Drawer(
          child: Container(
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
              padding: const EdgeInsets.only(top: 49.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/icon.png"),
                  const SizedBox(height: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Lakini",
                        style: Styles.textStyle16,
                      ),
                      Text(
                        "Lost And Founds",
                        style: Styles.textStyle16,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical:12),
                    color: const Color(0xff182533),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Row(
                     
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  "https://wdw888lb-7075.uks1.devtunnels.ms/resources/${cubit.profile.accountPhoto}"),
                            ),
                            const SizedBox(
                              width: 32,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  cubit.profile.userName,
                                  style: Styles.textStyle20
                                      .copyWith(color: Colors.white),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: Color(0xffF3F3F3),
                                    ),
                                    Text(
                                      "${cubit.profile.city},${cubit.profile.region}",
                                      style: Styles.textStyle14
                                          .copyWith(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomMenuItem(
                    title: 'Turn off notification ',
                    prefixIcon: Icons.notifications_off,
                    prefixIconColor: mainColor,
                    trailingWidget: Switch(
                      value: notificationValue,
                      activeColor: Colors.white,
                      inactiveTrackColor: darkGreenColor,
                      trackOutlineColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      inactiveThumbColor: Colors.white,
                      onChanged: (bool val) {
                        setState(() {
                          notificationValue = val;
                        });
                      },
                    ),
                    onTab: () {},
                  ),
                  CustomMenuItem(
                    title: 'My posts',
                    prefixIcon: Icons.post_add_sharp,
                    prefixIconColor: const Color.fromARGB(255, 57, 69, 114),
                    onTab: () {},
                  ),
                  CustomMenuItem(
                    title: 'Help',
                    prefixIcon: Icons.support,
                    prefixIconColor: const Color(0xff778FC0),
                    onTab: () {},
                  ),
                  CustomMenuItem(
                      title: 'Dark mode',
                      prefixIcon: Icons.dark_mode_outlined,
                      prefixIconColor: const Color.fromRGBO(32, 22, 88, 1),
                      trailingWidget: Switch(
                        value: themeValue,
                        activeColor: Colors.white,
                        inactiveTrackColor: darkGreenColor,
                        trackOutlineColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        inactiveThumbColor: Colors.white,
                        onChanged: (bool val) {
                          setState(() {
                            themeValue = val;
                          });
                        },
                      ),
                      onTab: () {},
                    ),
                  const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomMenuItem(
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
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
