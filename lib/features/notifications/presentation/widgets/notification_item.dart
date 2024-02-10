
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
          width: width * 0.05,
        ),
        const CircleAvatar(
          backgroundImage: AssetImage("assets/profile.jpg"),
          radius: 24,
        ),
        SizedBox(
          width: width * 0.03,
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Ali Mohamed: ",
                style: Styles.textStyle16
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              Expanded(
                child: Text(
                  "Added a post for a lost cat Dorem ipsum dolor sit.",
                  style: Styles.textStyle16
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w300),
                  overflow: TextOverflow.fade,
                ),
              ),
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
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
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
