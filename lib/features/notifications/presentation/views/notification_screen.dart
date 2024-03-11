import 'package:flutter/material.dart';

import '../widgets/custom_container.dart';
import '../widgets/notification_item.dart';
import '../widgets/separator.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: generateList(),
            ),
            Expanded(
                child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => const NotificationItem(),
              itemCount: 20,
              separatorBuilder: (BuildContext context, int index) =>
                  const Seprator(),
            ))
          ],
        ),
      ),
    );
  }

  generateList() {
    return Row(
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsets.only(left:16.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                value = index;
              });
            },
            child: customContainer(
              context: context,
              text: index == 0
                  ? "All"
                  : index == 1
                      ? "Losts"
                      : "Founds",
              isTapped: value == index ? true : false,
            ),
          ),
        ),
      ),
    );
  }
}
