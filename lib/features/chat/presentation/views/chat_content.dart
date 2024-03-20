import 'package:flutter/material.dart';
import 'package:lakini_gp/features/chat/presentation/wedgits/popup_menu_item.dart';


import '../../../../core/utils/styles.dart';

class ChatContent extends StatelessWidget {
  const ChatContent({Key? key}) : super(key: key);
  static String id = 'ChatContent';
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
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
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/chat_test.png"),
                    radius: 24,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mohmed hassen",
                        style: Styles.textStyle16,
                      ),
                      Text(
                        "Active now",
                        style: Styles.textStyle16
                            .copyWith(color: Color(0xffF3F3F3)),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.call),
                  ),
                  PopupMenuButton(
                    color: Colors.black,
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        onTap: () {},
                        child: CustomPopup(
                          hint: "View contact ",
                          icon: Icons.person,
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {},
                        child: CustomPopup(
                          hint: "Mute notification",
                          icon: Icons.notifications_off,
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {},
                        child: CustomPopup(
                          hint: "Block",
                          icon: Icons.block,
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {},
                        child: CustomPopup(
                          hint: "Delete chat",
                          icon: Icons.delete,
                        ),
                      ),
                      // ),
                    ],
                    child: Icon(Icons.more_vert),
                  ),
                ],
              )
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff182533),
                            borderRadius: BorderRadius.circular(22)),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Message",
                            prefixIcon: IconButton(
                              onPressed: () {
                                print('search button pressed');
                              },
                              icon: Icon(Icons.forum),
                            ),
                            suffixIcon: Container(
                              width: 100,
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      print('location button pressed');
                                    },
                                    icon: Icon(Icons.location_on),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      print('mic button pressed');
                                    },
                                    icon: Icon(Icons.photo_camera),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        color: Color(0xff0075FF),
                        borderRadius: BorderRadius.circular(30)),
                    child: IconButton(
                      iconSize: 24,
                      onPressed: () {},
                      icon: Icon(Icons.mic),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
