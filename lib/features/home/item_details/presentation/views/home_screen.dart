import 'package:flutter/material.dart';
import 'package:lakini_gp/features/chat/presentation/views/chat_screen.dart';
import 'package:lakini_gp/features/notifications/presentation/views/notification_screen.dart';

import '../../../../posts/presentation/views/post_screen.dart';
import '../../../../profile/presentation/views/profile_menu.dart';
import '../wedgits/buttom_navigation_button.dart';

import '../wedgits/home_body.dart';
import '../wedgits/menue.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = 'HomeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int cIndex = 0;
  var screens = [
    HomeBodey(),
    ChatScreen(),
    NotificationScreen(),
    ProfileMenu()
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(
                Icons.search,
                size: 30,
              ),
            ),
          ],
        ),
        // backgroundColor:,
        drawer: Menue(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Color(0xff0075FF), width: 1.0),
            ),
          ),
          child: BottomAppBar(
            height: height * .09,
            elevation: 0,
            color: Color.fromRGBO(1, 23, 48, 1),
            shape: const CircularNotchedRectangle(),
            notchMargin: 5,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ButtomNavigationButton(
                      onPressed: () {
                        setState(() {
                          cIndex = 0;
                          print(cIndex);
                        });
                      },
                      icon: Icons.home,
                      hint: "Home",
                      color: cIndex == 0 ? Colors.white : Color(0xff555557),
                    ),
                    ButtomNavigationButton(
                      onPressed: () {
                        setState(() {
                          cIndex = 1;
                        });
                      },
                      icon: Icons.chat,
                      hint: "Chat",
                      color: cIndex == 1 ? Colors.white : Color(0xff555557),
                    ),
                  ],
                ),
                Row(
                  children: [
                    ButtomNavigationButton(
                      onPressed: () {
                        setState(
                          () {
                            cIndex = 2;
                            print(cIndex);
                          },
                        );
                      },
                      icon: Icons.notifications,
                      hint: "Notifications",
                      color: cIndex == 2 ? Colors.white : Color(0xff555557),
                    ),
                    ButtomNavigationButton(
                      onPressed: () {
                        setState(() {
                          cIndex = 3;
                          print(cIndex);
                        });
                      },
                      icon: Icons.person,
                      hint: "Profile",
                      color: cIndex == 3 ? Colors.white : Color(0xff555557),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff0075FF),
          shape: CircleBorder(),
          onPressed: () {
            Navigator.pushNamed(context, AddPostScreen.id);
          },
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
        body: screens[cIndex],
      ),
    );
  }
}
