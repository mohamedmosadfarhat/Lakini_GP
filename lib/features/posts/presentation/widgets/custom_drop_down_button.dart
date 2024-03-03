import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class CustomDropDownButtonNew extends StatefulWidget {
  final Function()? onTap;
  final String hintText;
  final bool isExpanded;
  final List<String> items;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final Function(String?)? onChanged;
  final IconData? listPrefixIcon;
  final IconData? prefixIcon;

  const CustomDropDownButtonNew({
    Key? key,
    required this.onTap,
    required this.hintText,
    required this.isExpanded,
    required this.items,
    this.suffixIcon,
    this.controller,
    this.onChanged,
    this.listPrefixIcon,
    this.prefixIcon,
  }) : super(key: key);

  @override
  State<CustomDropDownButtonNew> createState() =>
      _CustomDropDownButtonNewState();
}

class _CustomDropDownButtonNewState extends State<CustomDropDownButtonNew> {
  TextEditingController searchController = TextEditingController();
  bool isExpanded = false;
  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems.addAll(widget.items);
  }

  void filterItems(String query) {
    setState(() {
      filteredItems = widget.items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void selectItem(String item) {
    setState(() {
      searchController.text = item;
      isExpanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              suffixIcon: Icon(widget.suffixIcon),
              prefixIcon:
                  widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
              hintText: widget.hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: mainColor,
                ),
              ),
              contentPadding: const EdgeInsets.all(16),
            ),
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            onChanged: filterItems,
          ),
        ),
        if (isExpanded)
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.only(bottom: 8),
            height: 150.0,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: mainColor),
                right: BorderSide(color: mainColor),
                left: BorderSide(color: mainColor),
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(8.0),
              ),
            ),
            child: ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    children: [
                      if (widget.listPrefixIcon != null)
                        Icon(
                          widget.listPrefixIcon,
                        )
                      else
                        const SizedBox(width: 0),
                      Text(filteredItems[index]),
                    ],
                  ),
                  onTap: () =>
                      selectItem(filteredItems[index]), // Select item on tap
                );
              },
            ),
          ),
      ],
    );
  }
}
