import 'package:flutter/material.dart';
import 'package:lakini_gp/core/utils/styles.dart';

import '../wedgits/chat_item.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ChatItem();
        });
  }
}
