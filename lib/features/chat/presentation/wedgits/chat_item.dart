import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lakini_gp/core/utils/styles.dart';
import 'package:lakini_gp/features/chat/presentation/views/chat_content.dart';
import 'package:lakini_gp/features/posts/data/models/users_model.dart';

import '../../../posts/presentation/manager/cubit/post_cubit/app_cubit.dart';
import '../../../posts/presentation/manager/cubit/post_cubit/app_state.dart';

class ChatItem extends StatelessWidget {
  final AllUsersData user;
  final String? message;
  final String? time;
  const ChatItem({
    required this.user,
    required this.message,
    required this.time,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DateTime apiDateTime = DateTime.parse(time ?? "");

    String formattedDateTime = DateFormat.MMMMEEEEd().format(apiDateTime);
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        print(cubit.lastChat?.content);
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChatContent(user: user)));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://wdw888lb-7075.uks1.devtunnels.ms/resources/${user.accountPhoto}"),
                      radius: 24,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.userName,
                          style: Styles.textStyle18,
                        ),
                        Text(
                          message ?? "",
                          style: Styles.textStyle14,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      formattedDateTime,
                      style: Styles.textStyle14.copyWith(color: Colors.blue),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
