import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakini_gp/features/posts/presentation/manager/cubit/post_cubit/app_cubit.dart';

import 'package:lakini_gp/features/posts/presentation/widgets/post_body_widget.dart';

import '../../../notifications/presentation/widgets/custom_container.dart';
import '../manager/cubit/post_cubit/app_state.dart';

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

  int value = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;

    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
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
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 44.0, bottom: 10),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: CircleAvatar(
                              radius: 22,
                              backgroundImage: NetworkImage(
                                  "https://wdw888lb-7075.uks1.devtunnels.ms/resources/${cubit.profile.accountPhoto}"),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: generateList(),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    PostBodyWidget(
                      type: value == 0 ? 'Lost' : "Found",
                      locationType: value == 0 ? "lost" : 'found',
                      dropDownHintText: value == 0
                          ? 'Choose your lost type'
                          : "Choose your found type ",
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  generateList() {
    return Row(
      children: List.generate(
        2,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                value = index;
              });
            },
            child: customContainer(
              context: context,
              text: index == 0 ? "Losts" : "Founds",
              isTapped: value == index ? true : false,
            ),
          ),
        ),
      ),
    );
  }
}
