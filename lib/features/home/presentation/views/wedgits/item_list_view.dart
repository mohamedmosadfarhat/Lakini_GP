import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:lakini_gp/core/utils/api_sevices.dart';
import 'package:lakini_gp/features/home/data/repos/home_repo_impl.dart';
import 'package:lakini_gp/features/home/presentation/manager/cubit/display_items_cubit.dart';
import 'package:lakini_gp/features/home/presentation/views/wedgits/custom_error_wedgit.dart';
import 'package:lakini_gp/features/home/presentation/views/wedgits/custom_item.dart';
import 'package:lakini_gp/features/home/presentation/views/wedgits/custom_loading_indicator.dart';

class ItemListView extends StatelessWidget {
  // const ItemListView({Key? key, }) : super(key: key);
  final String ctegoryName;
  // final String status;
  const ItemListView({
    required this.ctegoryName,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayItemsCubit, DisplayItemsState>(
      builder: (context, state) {
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
                  return Container(height: 0, child: Text(""));
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
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
