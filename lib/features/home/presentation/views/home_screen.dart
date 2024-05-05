import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lakini_gp/core/utils/styles.dart';
import 'package:lakini_gp/features/chat/presentation/views/chat_screen.dart';
import 'package:lakini_gp/features/home/presentation/views/wedgits/buttom_navigation_button.dart';
import 'package:lakini_gp/features/home/presentation/views/wedgits/home_body.dart';
import 'package:lakini_gp/features/notifications/presentation/views/notification_screen.dart';
import 'package:lakini_gp/features/posts/presentation/manager/cubit/post_cubit/app_cubit.dart';
import 'package:lakini_gp/features/posts/presentation/manager/cubit/post_cubit/app_state.dart';
import 'package:lakini_gp/features/posts/presentation/views/post_screen.dart';
import 'package:lakini_gp/features/profile/presentation/views/profile_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = 'HomeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int cIndex = 0;
  List<Widget> screens = [
    const HomeBodey(),
    const ChatScreen(),
    const NotificationScreen(),
    const ProfileMenu()
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => AppCubit()
        ..getCategory()
        ..getProfile()
        ..getAllUsers()
        ,
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Container(
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
            child: Scaffold(
              extendBody: true,
              backgroundColor: Colors.transparent,
              /*  floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked, */
              bottomNavigationBar: SafeArea(
                child: GNav(
                  backgroundColor: Colors.black,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 
                  onTabChange: (newIndex) {
                    setState(() {
                      cIndex = newIndex;
                    });
                  },
                  color: Colors.white,
                  tabShadow: const <BoxShadow>[BoxShadow(blurRadius: 5)],
                  tabActiveBorder: Border.all(color: mainColor),
                  duration: const Duration(milliseconds: 800),
                  tabBorderRadius: 10,
                  tabBackgroundColor:
                      Theme.of(context).canvasColor.withOpacity(0.1),
                  iconSize: 22,
                  curve: Curves.bounceInOut,
                  gap: 8,
                  tabs: <GButton>[
                    GButton(
                      icon: cIndex == 0 ? Icons.home : Icons.home_outlined,
                      text: "Home",
                      padding: const EdgeInsets.all(8),
                      textStyle: Styles.textStyle14,
                      gap: 5,
                    ),
                    GButton(
                      //  margin: EdgeInsets.all(),
                      icon: cIndex == 1 ? Icons.chat : Icons.chat_outlined,
                      text: "Chat",
                      padding: const EdgeInsets.all(8),
                      textStyle: Styles.textStyle14,
                      gap: 5,
                    ),
                    GButton(
                      icon: cIndex == 2
                          ? Icons.notifications
                          : Icons.notifications_active_outlined,
                      text: "Notifications",
                      padding: const EdgeInsets.all(8),
                      textStyle: Styles.textStyle14,
                      gap: 5,
                    ),
                    GButton(
                      icon: cIndex == 3 ? Icons.person : Icons.person_outlined,
                      text: "Profile",
                      padding: const EdgeInsets.all(8),
                      textStyle: Styles.textStyle14,
                      gap: 5,
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: const Color(0xff0075FF),
                shape: const CircleBorder(),
                onPressed: () {
                  Navigator.pushNamed(context, AddPostScreen.id);
                },
                child: const Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
              body: cubit.profile == null || cubit.category == null || cubit.users == null
                  ? Center(
                      child: Image.asset(
                        "assets/loadinBall.gif",
                        height: height * 0.13,
                        width: width * 0.13,
                      ),
                    )
                  : screens[cIndex],
            ),
          );
        },
      ),
    );
  }
}
