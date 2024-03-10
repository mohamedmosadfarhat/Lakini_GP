import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lakini_gp/constant.dart';
import 'package:lakini_gp/features/home/data/models/item_model.dart';
import 'package:lakini_gp/features/home/presentation/views/wedgits/custom_item.dart';

class ItemSearch extends SearchDelegate {
  List<ItemModel> itemsSearch;
  ItemSearch({required this.itemsSearch});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(115, 10, 6, 31), elevation: 0),
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("data ");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List filter = itemsSearch
        .where((element) => element.itemName!.startsWith(query))
        .toList();
    return Container(
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
      child: ListView.builder(
        itemCount: query == "" ? itemsSearch.length : filter.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomItem(
              itemModel: query == "" ? itemsSearch[index] : filter[index],
            ),
          );
        },
      ),
    );
  }
}
