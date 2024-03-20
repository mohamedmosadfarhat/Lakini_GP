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
import 'package:lakini_gp/features/posts/presentation/manager/cubit/post_cubit/app_cubit.dart';

import '../../../../posts/presentation/views/post_screen.dart';

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
    var height = MediaQuery.of(context).size.height;
    var cubit = AppCubit.get(context);
    List<Tab> tabs = cubit.category!.category.map((category) {
      return Tab(
        child: TabWedgit(
          CategoryName: category.categoryName,
        ),
      );
    }).toList();
    tabs.insert(
        0,
        const Tab(
          child: TabWedgit(
            CategoryName: 'All',
          ),
        ));
    List<Widget> itemView = cubit.category!.category.map((category) {
      return ItemListView(
        ctegoryName: category.categoryName,
      );
    }).toList();
    itemView.insert(
      0,
      const ItemListView(
        ctegoryName: "All",
      ),
    );
    List<String> categorytype = ["Losts", "Founds", "Missing"];
    return DefaultTabController(
      length: tabs.length,
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
                    return IconButton(
                      onPressed: () {
                        List<ItemModel> IS =
                            BlocProvider.of<DisplayItemsCubit>(context)
                                .itemsSearch;
                        showSearch(
                            context: context,
                            delegate: ItemSearch(itemsSearch: IS));
                      },
                      icon: const Icon(Icons.search),
                      iconSize: 30,
                    );
                  },
                ),

                //),
              ],
            ),
            drawer: const Menue(),
            //
            backgroundColor: Colors.transparent,
            body: BlocConsumer<DisplayItemsCubit, DisplayItemsState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                var cubit = AppCubit.get(context);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Discover !",
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
                                width: width * 0.2,
                                height: height * 0.05,
                                decoration: BoxDecoration(
                                    color: basicColor,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Image.asset("assets/search.png")
                              ),
                            ],
                          ),
                        ],
                      ),
                      TabBar(
                        dividerColor: Colors.transparent,
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        labelPadding: const EdgeInsets.only(right: 5),
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
                                            width: width * 0.6,
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
                       Expanded(
                        child: TabBarView(
                          children: itemView,
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
