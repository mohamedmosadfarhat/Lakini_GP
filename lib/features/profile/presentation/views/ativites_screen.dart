import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/api_sevices.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/data/repos/home_repo_impl.dart';
import '../../../home/presentation/manager/cubit/display_items_cubit.dart';
import '../../../home/presentation/views/wedgits/custom_item.dart';

class ActivitesScreen extends StatelessWidget {
  static const String id = 'Activity Screen';
  const ActivitesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DisplayItemsCubit(HomeRepoImpl(ApiService(Dio())))
        ..fetchItems("My-posts"),
      child: BlocBuilder<DisplayItemsCubit, DisplayItemsState>(
        builder: (context, state) {
          var width = MediaQuery.of(context).size.width;
          var height = MediaQuery.of(context).size.height;

          return RefreshIndicator(
            color: Colors.white,
            backgroundColor: const Color.fromRGBO(1, 44, 94, 1),
            onRefresh: () async {
              await BlocProvider.of<DisplayItemsCubit>(context)
                  .fetchItems("My-posts");
            },
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: const Color.fromARGB(255, 0, 14, 24),
                  elevation: 0,
                  title: Text(
                    "Activities",
                    style: Styles.textStyle28,
                  ),
                  centerTitle: true,
                ),
                body: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color.fromRGBO(1, 30, 63, 1),
                            Color.fromRGBO(1, 23, 48, 1),
                            Color.fromRGBO(0, 7, 15, 1),
                            Color.fromRGBO(0, 7, 15, 1),
                            Color.fromRGBO(0, 2, 5, 1),
                            Color.fromRGBO(1, 23, 48, 1),
                          ]),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 30),
                          child: Text(
                            "My posts",
                            style: Styles.textStyle16.copyWith(fontSize: 20),
                          ),
                        ),
                        state is DisplayItemsSuccess
                            ? Expanded(
                                child: ListView.builder(
                                    itemCount: state.items.length,
                                    itemBuilder: (context, index) {
                                      print(state.items.first);
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: CustomItem(
                                          itemModel: state.items[index],
                                        ),
                                      );
                                    }),
                              )
                            : Center(
                                child: Image.asset(
                                  "assets/loadinBall.gif",
                                  height: height * 0.13,
                                  width: width * 0.13,
                                ),
                              ),
                      ],
                    ))),
          );
        },
      ),
    );
  }
}
