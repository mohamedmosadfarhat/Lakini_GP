import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lakini_gp/core/utils/styles.dart';
import 'package:lakini_gp/features/posts/presentation/widgets/post_body_widget.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});
  static const String id = 'Post Screen';

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen>
    with TickerProviderStateMixin {
  String selectedValue = 'Anyone';

  List<DropdownMenuItem<String>> getDropDownItem = [
    const DropdownMenuItem(
      value: 'Anyone',
      child: Row(
        children: [Icon(Icons.group_outlined), Text('Anyone')],
      ),
    ),
    const DropdownMenuItem(
      value: 'Location',
      child: Row(
        children: [
          Icon(Icons.my_location),
          Text(' In the same location'),
        ],
      ),
    ),
  ];
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xff011730),
                  Color(0xff00070F),
                  Color(0xff00070F),
                  Color(0xff000205),
                  Color(0xff000205),
                  Color(0xff011730),
                ]),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 44.0, bottom: 10),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.close),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: CircleAvatar(
                          radius: 22,
                          backgroundImage: AssetImage('assets/pfp.png'),
                        ),
                      ),
                      DropdownButton<String>(
                        dropdownColor: const Color(0xff000001),
                        value: selectedValue,
                        items: getDropDownItem.toList(),
                        onChanged: (String? newVal) {
                          setState(() {
                            selectedValue = newVal!;
                          });
                        },
                      )
                    ],
                  ),
                ),
                /* Note: this is using tab Bar */
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TabBar(
                      indicatorWeight: 0,
                      tabAlignment: TabAlignment.start,
                      labelPadding: EdgeInsets.symmetric(
                        horizontal: width * 0.07,
                        vertical: 0,
                      ),
                      isScrollable: true, // Disable scrolling between tabs
                      controller: _controller,
                      dividerHeight: 0,
                      labelColor: Colors.white,
                      labelStyle: Styles.textStyle14
                          .copyWith(fontWeight: FontWeight.w600),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: mainColor,
                      ),
                      splashFactory: NoSplash.splashFactory,
                      tabs: const <Tab>[
                        Tab(text: 'Lost'),
                        Tab(text: 'Found'),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  height: height * 1.13,
                  child: TabBarView(
                    controller: _controller,
                    children: const [
                      PostBodyWidget(
                        type: 'Lost type',
                        locationType: 'lost',
                        dropDownHintText: 'Choose your lost type',
                      ),
                      PostBodyWidget(
                        type: 'Found type',
                        locationType: 'found',
                        dropDownHintText: 'Choose your found type',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
