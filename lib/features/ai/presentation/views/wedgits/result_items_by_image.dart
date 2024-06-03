import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakini_gp/core/utils/styles.dart';
import 'package:lakini_gp/features/ai/presentation/manager/image_cubit/search_by_image_cubit.dart';
import 'package:lakini_gp/features/home/presentation/views/wedgits/custom_error_wedgit.dart';
import 'package:lakini_gp/features/home/presentation/views/wedgits/custom_item.dart';
import 'package:lakini_gp/features/home/presentation/views/wedgits/custom_loading_indicator.dart';

class ResultItemsByImage extends StatelessWidget {
  const ResultItemsByImage({
    Key? key,
  }) : super(key: key);

  // final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<SearchByImageCubit, SearchByImageState>(
        builder: (context, state) {
          if (state is ResultSuccess) {
            if (state.items.isEmpty) {
              return Container(
                //color: const Color.fromRGBO(255, 193, 7, 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/edtit_search.png"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "No results found.",
                        style: Styles.textStyle20,
                      ),
                    ),
                    Text(
                      "Your search returned no results. Try shortening or rephrasing your search.",
                      style: Styles.textStyle14,
                    ),
                    Text(
                      "",
                      style: Styles.textStyle14,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 1, color: Colors.white),
                          ),
                          child: const Text("Edit Search"),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                return CustomItem(
                  itemModel: state.items[index],
                );
              },
            );
          } else if (state is ResultFailur) {
            return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 40),
                    child: CustomErrorWedgit(errorMsg: state.errorMeassage),
                  );
                });
          } else {
            return Center(child: CustomLoadingIndicator());
          }
        },
      ),
    );
  }
}
