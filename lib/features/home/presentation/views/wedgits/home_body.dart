// import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakini_gp/constant.dart';
import 'package:lakini_gp/core/utils/api_sevices.dart';
import 'package:lakini_gp/core/utils/styles.dart';
import 'package:lakini_gp/features/home/data/models/item_model.dart';
import 'package:lakini_gp/features/home/data/repos/home_repo_impl.dart';
import 'package:lakini_gp/features/home/presentation/manager/cubit/display_items_cubit.dart';
import 'package:lakini_gp/features/home/presentation/views/wedgits/item_list_view.dart';
import 'package:lakini_gp/features/home/presentation/views/wedgits/item_search.dart';
import 'package:lakini_gp/features/home/presentation/views/wedgits/menue.dart';
import 'package:lakini_gp/features/home/presentation/views/wedgits/tabs.dart';
import 'package:flutter/material.dart';

class HomeBodey extends StatefulWidget {
  const HomeBodey({Key? key}) : super(key: key);

  @override
  _HomeBodeState createState() => _HomeBodeState();
}

class _HomeBodeState extends State<HomeBodey> {
  int currentcategorytype = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    List<String> categorytype = ["Losts", "Founds", "Missing"];
    return DefaultTabController(
      length: tabs.length,
      child: Container(
        decoration: BoxDecoration(
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
        child: BlocProvider(
          create: (context) =>
              DisplayItemsCubit(HomeRepoImpl(ApiService(Dio())))..fetchItems(),
          child: Scaffold(
            //
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: [
                BlocConsumer<DisplayItemsCubit, DisplayItemsState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: IconButton(
                        onPressed: () {
                          List<ItemModel> IS =
                              BlocProvider.of<DisplayItemsCubit>(context)
                                  .itemsSearch;
                          showSearch(
                              context: context,
                              delegate: ItemSearch(itemsSearch: IS));
                        },
                        icon: Icon(Icons.search),
                        iconSize: 30,
                      ),
                    );
                  },
                ),

                //),
              ],
            ),
            drawer: Menue(),
            //
            backgroundColor: Colors.transparent,
            body: BlocConsumer<DisplayItemsCubit, DisplayItemsState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Descover !",
                              style: Styles.textStyle50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "what are you looking for ?",
                                  style: Styles.textStyle$20,
                                ),
                                Container(
                                  width: 55,
                                  decoration: BoxDecoration(
                                      color: basicColor,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.tune,
                                      size: 30,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: TabBar(
                          dividerColor: Colors.transparent,
                          tabAlignment: TabAlignment.start,
                          isScrollable: true,
                          labelPadding: EdgeInsets.only(right: 5),
                          physics: const ClampingScrollPhysics(),
                          padding: const EdgeInsets.only(
                              top: 20, left: 0, right: 0, bottom: 17),
                          unselectedLabelColor: Colors.grey,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: basicColor,
                          ),
                          tabs: tabs,
                        ),
                      ),
                      SizedBox(
                          height: 40,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: categorytype.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 34.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<DisplayItemsCubit>(
                                              context)
                                          .getStatus(index);
                                      currentcategorytype =
                                          BlocProvider.of<DisplayItemsCubit>(
                                                  context)
                                              .currentIndex;
                                    },
                                    child: Container(
                                      child: Stack(
                                        children: [
                                          Text(
                                            categorytype[index],
                                            style: Styles.textStyle20.copyWith(
                                                color:
                                                    currentcategorytype == index
                                                        ? Colors.blue
                                                        : Colors.white),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            child: Container(
                                              width: 200,
                                              height: 6,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color:
                                                    currentcategorytype == index
                                                        ? basicColor
                                                        : Colors.transparent,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              })),
                      Container(
                        width: double.infinity,
                        height: .3,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Expanded(
                        child: TabBarView(
                          children: [
                            ItemListView(
                              ctegoryName: "All",
                            ),
                            ItemListView(
                              ctegoryName: "People",
                            ),
                            ItemListView(
                              ctegoryName: "Animals",
                            ),
                            ItemListView(
                              ctegoryName: "Electronics",
                            ),
                            ItemListView(
                              ctegoryName: "Cars",
                            ),
                            ItemListView(
                              ctegoryName: "Clothes",
                            ),
                            ItemListView(
                              ctegoryName: "Documents",
                            ),
                            ItemListView(
                              ctegoryName: "Other",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
