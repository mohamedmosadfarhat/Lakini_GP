import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakini_gp/features/home/presentation/views/wedgits/menue.dart';
import 'package:lakini_gp/features/posts/presentation/manager/cubit/post_cubit/app_cubit.dart';

import '../../../../core/utils/styles.dart';
import '../../../posts/presentation/manager/cubit/post_cubit/app_state.dart';
import '../wedgits/chat_item.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromRGBO(1, 23, 48, 1),
                  Color.fromRGBO(1, 23, 48, 1),
                  Color.fromRGBO(0, 7, 15, 1),
                  Color.fromRGBO(0, 7, 15, 1),
                  Color.fromRGBO(0, 2, 5, 1),
                  Color.fromRGBO(1, 23, 48, 1),
                ]),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.search,
                    size: 30,
                  ),
                ),
              ],
            ),
            drawer: const Menue(),
            body: ListView.builder(
              itemCount: cubit.users!.user.length,
              itemBuilder: (context, index) {
                final user = cubit.users!.user[index];
                final message = cubit.lastM[index];
                final time = cubit.lastT[index];
                return ChatItem(user: user,message: message,time:time,);
              },
            ),
          ),
        );
      },
    );
  }
}
