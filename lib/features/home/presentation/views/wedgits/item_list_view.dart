import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lakini_gp/features/home/presentation/manager/cubit/display_items_cubit.dart';
import 'package:lakini_gp/features/home/presentation/views/wedgits/custom_error_wedgit.dart';
import 'package:lakini_gp/features/home/presentation/views/wedgits/custom_item.dart';
import 'package:lakini_gp/features/home/presentation/views/wedgits/custom_loading_indicator.dart';
import 'package:lakini_gp/features/posts/presentation/manager/cubit/post_cubit/app_cubit.dart';

import '../../../../../core/utils/styles.dart';

class ItemListView extends StatelessWidget {
  // const ItemListView({Key? key, }) : super(key: key);
  final String ctegoryName;
  // final String status;
  const ItemListView({
    required this.ctegoryName,
  });
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => AppCubit()
        ..getCategory()
        ..getProfile(),
      child: BlocBuilder<DisplayItemsCubit, DisplayItemsState>(
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          if (state is DisplayItemsSuccess) {
            return RefreshIndicator(
              onRefresh: () async {
                await BlocProvider.of<DisplayItemsCubit>(context).fetchItems();
              },
              child: ListView.builder(
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  if (ctegoryName == "All" &&
                      state.items[index].itemStatus ==
                          BlocProvider.of<DisplayItemsCubit>(context).status) {
                    return CustomItem(
                      itemModel: state.items[index],
                    );
                  } else if (state.items[index].categoryName == ctegoryName &&
                      state.items[index].itemStatus ==
                          BlocProvider.of<DisplayItemsCubit>(context).status) {
                    return CustomItem(
                      itemModel: state.items[index],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height * 0.1,
                        ),
                        Image.asset("assets/folder.png"),
                        Text(
                          "There is No Item!",
                          style: Styles.textStyle14,
                        )
                      ],
                    );
                  }
                },
              ),
            );
          } else if (state is DisplayItemsFailur) {
            return RefreshIndicator(
              onRefresh: () async {
                await BlocProvider.of<DisplayItemsCubit>(context).fetchItems();
              },
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 40),
                      child: CustomErrorWedgit(errorMsg: state.errorMeassage),
                    );
                  }),
            );
          } else if (cubit.category == null && cubit.profile == null) {
            return Center(
              child: Image.asset(
                "assets/loadinBall.gif",
                height: height * 0.13,
                width: width * 0.13,
              ),
            );
          } else {
            return Center(
              child: Image.asset(
                "assets/loadinBall.gif",
                height: height * 0.13,
                width: width * 0.13,
              ),
            );
          }
        },
      ),
    );
  }
}
