import 'package:flutter/material.dart';
import 'package:lakini_gp/constant.dart';

List<Tab> tabs = [
  Tab(
    child: TabWedgit(
      CategoryName: "All",
    ),
  ),
  Tab(
    child: TabWedgit(
      CategoryName: Kpeople,
    ),
  ),
  Tab(
    child: TabWedgit(
      CategoryName: KAnimal,
    ),
  ),
  Tab(
    child: TabWedgit(
      CategoryName: Kelectronics,
    ),
  ),
  Tab(
    child: TabWedgit(
      CategoryName: Kcars,
    ),
  ),
  Tab(
    child: TabWedgit(
      CategoryName: Kclothes,
    ),
  ),
  Tab(
    child: TabWedgit(
      CategoryName: Kdocuments,
    ),
  ),
  Tab(
    child: TabWedgit(
      CategoryName: Kdother,
    ),
  ),
];

class TabWedgit extends StatelessWidget {
  const TabWedgit({
    super.key,
    required this.CategoryName,
  });
  final String CategoryName;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey, width: .7),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            CategoryName,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
