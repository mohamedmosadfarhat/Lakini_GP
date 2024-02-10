import 'package:flutter/material.dart';
import 'package:lakini_gp/features/profile/widgets/custom_alert_dialog.dart';
import 'package:lakini_gp/features/profile/widgets/custom_menu_item.dart';

import '../../../../../core/utils/styles.dart';

class Menue extends StatefulWidget {
  const Menue({Key? key}) : super(key: key);

  @override
  State<Menue> createState() => _MenueState();
}

class _MenueState extends State<Menue> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
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
              Image.asset("assets/menue_img.png"),
              const SizedBox(
                height: 53,
              ),
              Container(
                color: Color(0xff182533),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/pfp.png'),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ahmed Sherif',
                          style: Styles.textStyle20.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Row(
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
                      ],
                    )
                  ]),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomMenuItem(
                title: 'Turn off notification ',
                prefixIcon: Icons.notifications_off,
                prefixIconColor: const Color(0xff00C6DD),
                trailingWidget: Switch(
                  value: value,
                  activeColor: Colors.white,
                  inactiveTrackColor: darkGreenColor,
                  trackOutlineColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
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
                title: 'My posts',
                prefixIcon: Icons.post_add_sharp,
                prefixIconColor: const Color(0xff4CD964),
                onTab: () {},
              ),
              CustomMenuItem(
                title: 'Help',
                prefixIcon: Icons.support,
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
        ),
      ),
    );
  }
}
