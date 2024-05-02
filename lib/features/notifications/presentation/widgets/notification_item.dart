import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(
          width: width * 0.03,
        ),
        const CircleAvatar(
          backgroundImage: AssetImage("assets/profile.jpg"),
          radius: 30,
        ),
        SizedBox(
          width: width * 0.03,
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: Styles.textStyle16.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                    children: const [
                      TextSpan(
                        text: 'Ali Mohamed:',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text:
                            ' Added a post for a lost cat Dorem ipsum dolor sit.',
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Column(
          children: [
            // SizedBox(height: height*0.03,),
            Text(
              "34m",
              style: Styles.textStyle14.copyWith(fontSize: 12),
            ),
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: const Color.fromRGBO(24, 37, 51, 1),
                      context: context,
                      builder: (_) {
                        return Wrap(
                          children: [
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Container(
                                  height: 4,
                                  width: width * 0.1,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: ListTile(
                                leading: const Icon(Icons.delete_outlined,
                                    color: Colors.white),
                                title: Text(
                                  "Delete notification",
                                  style: Styles.textStyle16,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: ListTile(
                                leading: const Icon(
                                  Icons.notifications_off_outlined,
                                  color: Colors.white,
                                ),
                                title: Text(
                                  "Turn off notification",
                                  style: Styles.textStyle16,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                        );
                      });
                },
                icon: const Icon(Icons.keyboard_control_sharp)),
          ],
        )
      ],
    );
  }
}
