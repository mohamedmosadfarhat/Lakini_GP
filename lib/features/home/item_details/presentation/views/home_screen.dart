import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lakini_gp/features/chat/presentation/views/chat_screen.dart';
import 'package:lakini_gp/features/notifications/presentation/views/notification_screen.dart';

import '../../../../profile/presentation/views/profile_menu.dart';
import '../wedgits/buttom_navigation_button.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//   static String id = 'HomeScreen';
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int cIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return SafeArea(
//       child: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               // Color.fromRGBO(1, 23, 48, 1),
//               // Color.fromRGBO(1, 23, 48, 1),
//               // Color.fromRGBO(0, 7, 15, 1),
//               // Color.fromRGBO(0, 7, 15, 1),
//               // Color.fromRGBO(0, 2, 5, 1),
//               // Color.fromRGBO(1, 23, 48, 1),
//               Color(0xff011730),
//               Color(0xff00070F),
//               Color(0xff00070F),
//               Color(0xff000205),
//               Color(0xff000205),
//               Color(0xff011730),
//             ],
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//           ),
//         ),

//           floatingActionButton: FloatingActionButton(
//             backgroundColor: Color(0xff0075FF),
//             shape: CircleBorder(),
//             onPressed: () {},
//             child: Icon(
//               Icons.add,
//               size: 40,
//             ),
//           ),
//           body: screens[cIndex],
//         child: Scaffold(
//           backgroundColor: Colors.transparent,
//           appBar: AppBar(
//             elevation: 0,
//             backgroundColor: Colors.transparent,
//             actions: [
//               Padding(
//                 padding: const EdgeInsets.only(right: 15),
//                 child: Icon(
//                   Icons.search,
//                   size: 30,
//                 ),
//               ),
//             ],
//           ),
//           // backgroundColor:,
//           drawer: Menue(),
//           floatingActionButtonLocation:
//               FloatingActionButtonLocation.centerDocked,
//           bottomNavigationBar: Container(
//             decoration: BoxDecoration(
//               color: Colors.transparent,
//               border: Border(
//                   // top: BorderSide(color: Color(0xff0075FF), width: 1.0),
//                   ),
//             ),
//             child: BottomAppBar(
//               height: height * .08,
//               padding: EdgeInsets.symmetric(vertical: 10),
//               elevation: 0,
//               color: Colors.amber,
//               clipBehavior: Clip.antiAlias,
//               shape:CircularNotchedRectangle(),

//               notchMargin: 10,
//               child: Container(
//                   child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       ButtomNavigationButton(
//                         onPressed: () {
//                           setState(() {
//                             cIndex = 0;
//                             print(cIndex);
//                           });
//                         },
//                         icon: Icons.home,
//                         hint: "Home",
//                         color: cIndex == 0 ? Colors.white : Color(0xff555557),
//                       ),
//                       ButtomNavigationButton(
//                         onPressed: () {
//                           setState(() {
//                             cIndex = 1;
//                           });
//                         },
//                         icon: Icons.chat,
//                         hint: "Chat",
//                         color: cIndex == 1 ? Colors.white : Color(0xff555557),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       ButtomNavigationButton(
//                         onPressed: () {
//                           setState(
//                             () {
//                               cIndex = 2;
//                               print(cIndex);
//                             },
//                           );
//                         },
//                         icon: Icons.notifications,
//                         hint: "Notifications",
//                         color: cIndex == 2 ? Colors.white : Color(0xff555557),
//                       ),
//                       ButtomNavigationButton(
//                         onPressed: () {
//                           setState(() {
//                             cIndex = 3;
//                             print(cIndex);
//                           });
//                         },
//                         icon: Icons.person,
//                         hint: "Profile",
//                         color: cIndex == 3 ? Colors.white : Color(0xff555557),
//                       ),
//                     ],
//                   )
//                 ],
//               )),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   var screens = [
//     HomeBodey(),
//     ChatScreen(),
//     NotificationScreen(),
//     ProfileMenu()
//   ];
// }

// //
// class CircularNotchedRectangleWithBorder extends CircularNotchedRectangle {
//   final BorderSide borderSide;

//   CircularNotchedRectangleWithBorder({required this.borderSide});

//   @override
//   Path getOuterPath(Rect host, Rect? guest) {
//     if (guest == null || guest.isFinite || guest.isEmpty) {
//       return Path()..addRect(host);
//     }

//     final double notchRadius = guest.width / 2.0;

//     const double s1 = 15.0;
//     const double s2 = 1.0;

//     final double r = borderSide.width;
//     final double a = -1.0 *
//         (s2 * s2 + notchRadius * notchRadius - s1 * s1) /
//         (2 * s2 * notchRadius);
//     final double A = a * (pi / 180);
//     final double x = s2 * cos(A);
//     final double y = s2 * sin(A);

//     return Path()
//       ..moveTo(0.0, 0.0)
//       ..lineTo(guest.left - r, 0.0)
//       ..arcTo(
//         Rect.fromCircle(center: Offset(guest.left, 0.0), radius: r),
//         pi - acos(x),
//         acos(x),
//         false,
//       )
//       ..lineTo(guest.right - r, y)
//       ..arcTo(
//         Rect.fromCircle(center: Offset(guest.right, 0.0), radius: r),
//         acos(x),
//         pi - acos(x),
//         false,
//       )
//       ..lineTo(host.width, 0.0)
//       ..lineTo(host.width, host.height)
//       ..lineTo(0.0, host.height)
//       ..close();
//   }
// }


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
            color: Colors.transparent,
            shape: CircularNotchedRectangle(),
            notchMargin: 10,
            child: Container(
                child: Row(
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
              ],
            )),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff0075FF),
          shape: CircleBorder(),
          onPressed: () {},
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
        body: SafeArea(
          child: screens[cIndex],
        ),
      ),
    );
  }

  var screens = [
    HomeBodey(),
    ChatScreen(),
    NotificationScreen(),
    ProfileMenu()
  ];
}
