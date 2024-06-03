import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakini_gp/constant.dart';
import 'package:lakini_gp/core/utils/api_sevices.dart';
import 'package:lakini_gp/core/utils/styles.dart';
import 'package:lakini_gp/features/ai/data/repo/ai_repo_imp.dart';
import 'package:lakini_gp/features/ai/presentation/manager/Description_cubit/search_by_description_cubit.dart';
import 'package:lakini_gp/features/home/presentation/views/wedgits/capitalize_extension.dart';
import 'package:lakini_gp/features/home/presentation/views/wedgits/custom_item.dart';
import 'package:lakini_gp/features/home/presentation/views/wedgits/custom_loading_indicator.dart';

class ResultByDescription extends StatelessWidget {
  const ResultByDescription({Key? key, required this.description})
      : super(key: key);

  final String description;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) =>
          SearchByDescriptionCubit(AiRepoImpl(ApiService(Dio())))
            ..fetchResultByDescription(description),
      child: Container(
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
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Row(
              children: [
                Text(
                  "Search with ",
                  style: Styles.textStyle30,
                ),
                Text(
                  "Ai",
                  style: Styles.textStyle30.copyWith(color: Colors.blue),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.description,
                    size: 35,
                    color: Colors.blue,
                  ),
                  Flexible(
                    child: Text(description.capitalize(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: Styles.textStyle18.copyWith(color: Colors.blue)),
                  ),
                ],
              ),
              SizedBox(
                height: height * .05,
              ),
              Container(
                child: BlocConsumer<SearchByDescriptionCubit,
                    SearchByDescriptionState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: basicColor,
                              size: 34,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Research Results",
                                style: Styles.textStyle28,
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: height * .05,
              ),
              Expanded(
                child: BlocBuilder<SearchByDescriptionCubit,
                    SearchByDescriptionState>(
                  builder: (context, state) {
                    if (state is ResultByDescritionSuccess) {
                      if (state.items.isEmpty) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/edtit_search.png"),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "No results found.",
                                style: Styles.textStyle28,
                              ),
                            ),
                            Text(
                              "Your search returned no results. Try shortening ",
                              style: Styles.textStyle14,
                            ),
                            Text(
                              "or rephrasing your search.",
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
                                    border: Border.all(
                                        width: 1, color: Colors.white),
                                  ),
                                  child: const Text("Edit Search"),
                                ),
                              ),
                            )
                          ],
                        );
                      }
                      return ListView.builder(
                        itemCount: state.items.length,
                        itemBuilder: (context, index) {
                          print(state.items.length);
                
                          print("else");
                          return CustomItem(
                            itemModel: state.items[index],
                          );
                        },
                      );
                    } else if (state is ResultByDescritionFailur) {
                      return const Text(
                          "Oops There was an Error, Please try again");
                      // return ListView.builder(
                      //     itemCount: 1,
                      //     itemBuilder: (context, index) {
                      //       return Padding(
                      //         padding: const EdgeInsets.symmetric(
                      //             horizontal: 20.0, vertical: 40),
                      //         child: CustomErrorWedgit(
                      //             errorMsg: state.errorMeassage),
                      //       );
                      //     });
                    } else {
                      return Center(child: CustomLoadingIndicator());
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
