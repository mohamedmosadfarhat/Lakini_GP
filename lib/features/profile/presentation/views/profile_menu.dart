// import 'dart:ui';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:lakini_gp/core/utils/styles.dart';
// import 'package:lakini_gp/features/profile/presentation/views/edit_profile.dart';
// import 'package:lakini_gp/features/profile/presentation/views/terms_and_conditions_screen.dart';
// import 'package:lakini_gp/features/profile/widgets/custom_alert_dialog.dart';
// import 'package:lakini_gp/features/profile/widgets/custom_app_bar.dart';
// import 'package:lakini_gp/features/profile/widgets/custom_menu_item.dart';

// class ProfileMenu extends StatefulWidget {
//   const ProfileMenu({super.key});

//   static const String id = 'Profile Menu';

//   @override
//   State<ProfileMenu> createState() => _ProfileMenuState();
// }

// class _ProfileMenuState extends State<ProfileMenu> {
//   bool value = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//                 begin: Alignment.topRight,
//                 end: Alignment.bottomLeft,
//                 colors: [
//                   Color(0xff011730),
//                   Color(0xff00070F),
//                   Color(0xff00070F),
//                   Color(0xff000205),
//                   Color(0xff000205),
//                   Color(0xff011730),
//                 ]),
//           ),
//           child: Center(
//             child: Column(
//               children: [
//                 const CustomAppBar(
//                   postIcon: Icons.edit,
//                   preIcon: Icons.menu,
//                 ),
//                 const CircleAvatar(
//                   radius: 66,
//                   backgroundImage: AssetImage('assets/pfp.png'),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     'Ahmed Sherif',
//                     style: Styles.textStyle20.copyWith(
//                         fontWeight: FontWeight.bold, color: Colors.white),
//                   ),
//                 ),
//                 Text(
//                   'ahmedalii12336@gmail.com',
//                   style: Styles.textStyle14.copyWith(
//                     color: const Color(0xffF3F3F3),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Icon(
//                       Icons.location_on_outlined,
//                       color: Color(0xffF3F3F3),
//                     ),

//                     Text(
//                       'Biala Kafr El_Sheikh',
//                       style: Styles.textStyle14.copyWith(
//                         color: const Color(0xffF3F3F3),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Divider(
//                   thickness: 1,
//                   indent: 15,
//                   endIndent: 15,
//                   color: Colors.grey.withOpacity(0.5),
//                 ),
//                 Column(
//                   children: [
//                     CustomMenuItem(
//                       title: 'Dark mode',
//                       prefixIcon: Icons.dark_mode_outlined,
//                       prefixIconColor: const Color(0xff7C15FF),
//                       trailingWidget: Switch(
//                         value: value,
//                         activeColor: Colors.white,
//                         inactiveTrackColor: darkGreenColor,
//                         trackOutlineColor: MaterialStateProperty.all<Color>(
//                             Colors.transparent),
//                         inactiveThumbColor: Colors.white,
//                         onChanged: (bool val) {
//                           setState(() {
//                             value = val;

//                     onTab: () {},
//                   ),
//                   CustomMenuItem(
//                     title: 'Terms and Conditions',
//                     prefixIcon: Icons.image_outlined,
//                     postIcon: Icons.arrow_forward_ios,
//                     prefixIconColor: const Color(0xff5BDB60),
//                     onTab: () {
//                       Navigator.pushNamed(context, TermsAndConditionScreen.id);
//                     },
//                   ),
//                   CustomMenuItem(
//                     title: 'Activities',
//                     prefixIcon: Icons.person_search_outlined,
//                     postIcon: Icons.arrow_forward_ios,
//                     prefixIconColor: const Color(0xff00C6DD),
//                     onTab: () {},
//                   ),
//                   CustomMenuItem(
//                     title: 'Delete account',
//                     prefixIcon: Icons.person_remove_alt_1_outlined,
//                     postIcon: Icons.arrow_forward_ios,
//                     prefixIconColor: const Color(0xffFFC266),
//                     onTab: () {
//                       showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return const CustomAlertDialog(
//                               content: 'You want to delete account ',
//                               buttonText2: 'Delete',
//                             );
//                           });
//                     },
//                   ),
//                   CustomMenuItem(
//                     title: 'Help',
//                     prefixIcon: Icons.support,
//                     postIcon: Icons.arrow_forward_ios,
//                     prefixIconColor: const Color(0xff778FC0),
//                     onTab: () {},
//                   ),
//                   CustomMenuItem(
//                     title: 'Logout',
//                     prefixIcon: Icons.logout_outlined,
//                     prefixIconColor: const Color(0xffEA4335),
//                     onTab: () {
//                       showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return const CustomAlertDialog(
//                               content: 'You want to exit the application ',
//                               buttonText2: 'Logout',
//                             );
//                           });
//                         },
//                       ),
//                       onTab: () {},
//                     ),
//                     // CustomMenuItem(
//                     //   title: 'Terms and Conditions',
//                     //   prefixIcon: Icons.image_outlined,
//                     //   postIcon: Icons.arrow_forward_ios,
//                     //   prefixIconColor: const Color(0xff5BDB60),
//                     //   onTab: () {
//                     //     Navigator.pushNamed(
//                     //         context, TermsAndConditionScreen.id);
//                     //   },
//                     // ),
//                     CustomMenuItem(
//                       title: 'Activities',
//                       prefixIcon: Icons.person_search_outlined,
//                       postIcon: Icons.arrow_forward_ios,
//                       prefixIconColor: const Color(0xff00C6DD),
//                       onTab: () {},
//                     ),
//                     CustomMenuItem(
//                       title: 'Delete account',
//                       prefixIcon: Icons.person_remove_alt_1_outlined,
//                       postIcon: Icons.arrow_forward_ios,
//                       prefixIconColor: const Color(0xffFFC266),
//                       onTab: () {
//                         showDialog(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return const CustomAlertDialog(
//                                 content: 'You want to exit the application ',
//                                 buttonText2: 'Logout',
//                               );
//                             });
//                       },
//                     ),
//                     CustomMenuItem(
//                       title: 'Help',
//                       prefixIcon: Icons.support,
//                       postIcon: Icons.arrow_forward_ios,
//                       prefixIconColor: const Color(0xff778FC0),
//                       onTab: () {},
//                     ),
//                     CustomMenuItem(
//                       title: 'Logout',
//                       prefixIcon: Icons.logout_outlined,
//                       prefixIconColor: const Color(0xffEA4335),
//                       onTab: () {
//                         showDialog(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return const CustomAlertDialog(
//                                 content: 'You want to exit the application ',
//                                 buttonText2: 'Logout',
//                               );
//                             });
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lakini_gp/core/utils/styles.dart';
import 'package:lakini_gp/features/profile/presentation/views/edit_profile.dart';
import 'package:lakini_gp/features/profile/presentation/views/terms_and_conditions_screen.dart';
import 'package:lakini_gp/features/profile/widgets/custom_alert_dialog.dart';
import 'package:lakini_gp/features/profile/widgets/custom_app_bar.dart';
import 'package:lakini_gp/features/profile/widgets/custom_menu_item.dart';

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
          child: Center(
            child: Column(
              children: [
                const CustomAppBar(
                  postIcon: Icons.edit,
                  preIcon: Icons.menu,
                ),
                const CircleAvatar(
                  radius: 66,
                  backgroundImage: AssetImage('assets/pfp.png'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Ahmed Sherif',
                    style: Styles.textStyle20.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                Text(
                  'ahmedalii12336@gmail.com',
                  style: Styles.textStyle14.copyWith(
                    color: const Color(0xffF3F3F3),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Color(0xffF3F3F3),
                    ),
                    Text(
                      'Biala Kafr El_Sheikh',
                      style: Styles.textStyle14.copyWith(
                        color: const Color(0xffF3F3F3),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 1,
                  indent: 15,
                  endIndent: 15,
                  color: Colors.grey.withOpacity(0.5),
                ),
                Column(
                  children: [
                    CustomMenuItem(
                      title: 'Dark mode',
                      prefixIcon: Icons.dark_mode_outlined,
                      prefixIconColor: const Color(0xff7C15FF),
                      trailingWidget: Switch(
                        value: value,
                        activeColor: Colors.white,
                        inactiveTrackColor: darkGreenColor,
                        trackOutlineColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        inactiveThumbColor: Colors.white,
                        onChanged: (bool val) {
                          setState(() {
                            value = val;
                          });
                        },
                      ),
                      onTab: () {},
                    ),
                    CustomMenuItem(
                      title: 'Terms and Conditions',
                      prefixIcon: Icons.image_outlined,
                      postIcon: Icons.arrow_forward_ios,
                      prefixIconColor: const Color(0xff5BDB60),
                      onTab: () {
                        Navigator.pushNamed(
                            context, TermsAndConditionScreen.id);
                      },
                    ),
                    CustomMenuItem(
                      title: 'Activities',
                      prefixIcon: Icons.person_search_outlined,
                      postIcon: Icons.arrow_forward_ios,
                      prefixIconColor: const Color(0xff00C6DD),
                      onTab: () {},
                    ),
                    CustomMenuItem(
                      title: 'Delete account',
                      prefixIcon: Icons.person_remove_alt_1_outlined,
                      postIcon: Icons.arrow_forward_ios,
                      prefixIconColor: const Color(0xffFFC266),
                      onTab: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const CustomAlertDialog(
                                content: 'You want to delete account ',
                                buttonText2: 'Delete',
                              );
                            });
                      },
                    ),
                    CustomMenuItem(
                      title: 'Help',
                      prefixIcon: Icons.support,
                      postIcon: Icons.arrow_forward_ios,
                      prefixIconColor: const Color(0xff778FC0),
                      onTab: () {},
                    ),
                    CustomMenuItem(
                      title: 'Logout',
                      prefixIcon: Icons.logout_outlined,
                      prefixIconColor: const Color(0xffEA4335),
                      onTab: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const CustomAlertDialog(
                                content: 'You want to exit the application ',
                                buttonText2: 'Logout',
                              );
                            });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
