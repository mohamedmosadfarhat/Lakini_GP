import 'package:flutter/material.dart';
import 'package:lakini_gp/core/utils/styles.dart';
import 'package:lakini_gp/features/chat/presentation/views/chat_content.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ChatContent.id);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      style: Styles.textStyle18,
                    ),
                    Text("Where are you now"),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 19,
                  height: 19,
                  decoration: BoxDecoration(
                    color: Color(0xff007AFF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(child: Text("1")),
                ),
                Text(
                  "5.23 PM",
                  style: TextStyle(color: Color(0xff007AFF)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
