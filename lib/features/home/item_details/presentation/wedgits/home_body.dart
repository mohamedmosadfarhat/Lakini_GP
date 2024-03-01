import 'package:flutter/material.dart';
import 'package:lakini_gp/core/utils/styles.dart';


import 'custom_item.dart';

class HomeBodey extends StatefulWidget {
  const HomeBodey({Key? key}) : super(key: key);

  @override
  _HomeBodeState createState() => _HomeBodeState();
}

class _HomeBodeState extends State<HomeBodey> {
  int currentcategory = 0;
  int currentcategorytype = 0;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    List<String> categories = [
      "All",
      "People",
      "Ainmal",
      "Phones",
      "cars",
      "documents"
    ];
    List<String> categorytype = ["Losts", "Founds", "Missing"];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello !",
                  style: Styles.textStyle50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "what are you looking for ?",
                      style: Styles.textStyle20,
                    ),
                    Container(
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15)),
                      child: IconButton(
                        onPressed: () {
                          //Navigator.pushNamed(context, SearchingWithAi.id);
                        },
                        icon: Icon(
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
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 40,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentcategory = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Categories(
                        current: currentcategory,
                        categories: categories,
                        index: index,
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 30,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categorytype.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentcategorytype = index;
                        });
                      },
                      child: Container(
                        child: Stack(
                          children: [
                            Text(
                              categorytype[index],
                              style: Styles.textStyle20.copyWith(
                                  color: currentcategorytype == index
                                      ? Colors.blue
                                      : Colors.white),
                            ),
                            Positioned(
                              bottom: -2,
                              child: Container(
                                  width: 90,
                                  height: 5,
                                  color: currentcategorytype == index
                                      ? Colors.blue
                                      : Colors.transparent),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 7,
                itemBuilder: (contex, index) {
                  return CustomItem();
                }),
          )
        ],
      ),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories(
      {super.key,
      required this.current,
      required this.categories,
      required this.index});

  final int current;
  final List<String> categories;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: current == index ? Colors.blue : Colors.transparent,
        border: Border.all(
            color: current == index ? Colors.blue : Color(0xff555557)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        child: Text(categories[index], style: Styles.textStyle16),
      ),
    );
  }
}
