import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:lakini_gp/core/utils/styles.dart';
import 'package:lakini_gp/features/posts/data/repos/add_post_repo.dart';

import 'package:lakini_gp/features/posts/presentation/manager/cubit/category_cubit/category_cubit.dart';
import 'package:lakini_gp/features/posts/presentation/manager/cubit/post_cubit/add_item_cubit.dart';
import 'package:lakini_gp/features/posts/presentation/manager/cubit/post_cubit/add_item_state.dart';
import 'package:lakini_gp/features/posts/presentation/views/post_added.dart';
import 'package:lakini_gp/features/posts/presentation/widgets/custom_drop_down_button.dart';
import 'package:lakini_gp/features/posts/presentation/widgets/custom_text_field.dart';
import 'package:lakini_gp/features/posts/presentation/widgets/found_reward.dart';
import 'package:lakini_gp/features/posts/presentation/widgets/image_picker_daialog.dart';

import 'package:lakini_gp/features/posts/presentation/widgets/snackBar_error_widget.dart';
import 'package:lakini_gp/features/register/presentation/views/login_screen.dart';
import 'package:lakini_gp/features/register/widgets/custom_auth_button.dart';
import 'package:lakini_gp/features/register/widgets/custom_drop_down_form_field.dart';

import '../../services/city_view_model.dart';
import 'add_image_container.dart';

class PostBodyWidget extends StatefulWidget {
  const PostBodyWidget({
    super.key,
    required this.type,
    required this.locationType,
    required this.dropDownHintText,
  });
  final String type;
  final String locationType;
  final String dropDownHintText;
  @override
  State<PostBodyWidget> createState() => _PostBodyWidgetState();
}

class _PostBodyWidgetState extends State<PostBodyWidget> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController yourPlaceController = TextEditingController();
  final TextEditingController locationOfLostFoundController =
      TextEditingController();
  final TextEditingController foundRewardController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController rewardController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String value = 'reward';
  bool isExpanded = false;
  bool isLoading = false;
  String? selectedLostType;
  List<String> items = [
    'Clothes ',
    'Phones',
    'Watches',
    'People',
    'Electronics',
  ];
  CityViewModel cityViewModel = CityViewModel();
  int characterCount = 0;

  void updateCharacterCount(String newText) {
    setState(() {
      characterCount = newText.length;
    });
  }

  @override
  void initState() {
    super.initState();
    cityViewModel.fetchCityNames();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddItemCubit()),
      ],
      child:
          BlocConsumer<AddItemCubit, AddItemState>(listener: (context, state) {
        if (state is AddItemSuccess) {
          buildSnackBar(
              context: context,
              text: "Item Added Successfully",
              clr: const Color(0xff011730));
          Navigator.pushNamed(context, PostAddedSuccessScreen.id);
        } else if (state is AddItemFailure) {
          showSnackBarMessage(context, "Failed To Add Item");
        }
      }, builder: (context, state) {
        var cubit = AddItemCubit.get(context);
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.type,
                style: Styles.textStyle18,
              ),
              CustomDropDownFormField(
                hintText: 'Enter your lost Type',
                items: items,
                onItemSelected: (selectedType) {
                  selectedLostType = selectedType;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Add photo',
                    style: Styles.textStyle18,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ImagePickerDialog(
                        onImageSourceSelected: (ImageSource source) {
                          cubit.fetchImage();
                        },
                      );
                    },
                  );
                },
                child: cubit.pickedImage == null
                    ? const UploadImg()
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.file(cubit.pickedImage!,
                            fit: BoxFit.cover, height: 96, width: 96),
                      ),
              ),

              /*  SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < imagePaths.length; i++)
                      AddImageContainer(
                        imagePath: imagePaths[i],
                        onDelete: () {
                          setState(() {
                            imagePaths.removeAt(i);
                          });
                        },
                      ),
                    if (imagePaths.length < 4)
                      AddImageContainer(
                        widgetChild: IconButton(
                          onPressed: () async {

                          },
                          icon: const Icon(
                            Icons.add_photo_alternate_outlined,
                            size: 24,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                  ],
                ),
              ), */
              Text(
                'Add title',
                style: Styles.textStyle18,
              ),
              CustomTextFieldPost(
                hintText: 'Add Title',
                textEditingController: nameController,
              ),
              Row(
                children: [
                  Text(
                    'Add caption',
                    style: Styles.textStyle18.copyWith(color: Colors.white),
                  ),
                  Text(
                    ' ($characterCount/250)',
                    style: Styles.textStyle14.copyWith(color: Colors.grey),
                  ),
                ],
              ),
              CustomTextFieldPost(
                hintText: 'Add caption',
                textEditingController: descController,
                onChanged: updateCharacterCount,
              ),
              Text(
                'Your phone',
                style: Styles.textStyle18,
              ),
              CustomTextFieldPost(
                hintText: '+20 01 789 9348',
                icon: Icons.phone_outlined,
                textEditingController: phoneController,
              ),
              Text(
                'Location of ${widget.locationType}',
                style: Styles.textStyle18,
              ),
              CustomDropDownButtonNew(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                    cityViewModel.cityNames;
                  });
                },
                hintText: 'Enter location of ${widget.locationType}',
                listPrefixIcon: Icons.location_on_outlined,
                isExpanded: isExpanded,
                suffixIcon: Icons.arrow_drop_down_outlined,
                prefixIcon: Icons.location_on_outlined,
                items: cityViewModel.cityNames,
                controller: locationOfLostFoundController,
              ),
              Text(
                'Your Location',
                style: Styles.textStyle18,
              ),
              CustomDropDownButtonNew(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                    cityViewModel.cityNames;
                  });
                },
                hintText: 'Enter your location',
                listPrefixIcon: Icons.location_on_outlined,
                isExpanded: isExpanded,
                suffixIcon: Icons.arrow_drop_down_outlined,
                prefixIcon: Icons.location_on_outlined,
                items: cityViewModel.cityNames,
                controller: yourPlaceController,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Visibility(
                visible: widget.locationType.toLowerCase() == 'lost',
                /*This for Found tab*/
                replacement: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add a price if no owner is found',
                      style: Styles.textStyle18,
                    ),
                    FoundReward(
                      textEditingController: foundRewardController,
                    ),
                  ],
                ),

                /*This for lost tab*/
                child: Row(
                  children: [
                    Material(
                      type: MaterialType.transparency,
                      child: Radio(
                        activeColor: mainColor,
                        value: 'Add a reward',
                        groupValue: value,
                        onChanged: (val) {
                          setState(() {
                            value = val!;
                          });
                        },
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                    Text(
                      'Add a reward',
                      style: Styles.textStyle16,
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(8),
                      height: height * 0.06,
                      width: width * 0.3,
                      decoration: BoxDecoration(
                        color: const Color(0xff0E1823),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: rewardController,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(7),
                                  border: InputBorder.none,
                                  hintText: '0000',
                                  hintStyle: Styles.textStyle18.copyWith(
                                      color: const Color(0xff555557))),
                            ),
                          ),
                          Text(
                            'EGP',
                            style: Styles.textStyle18,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomRegisterButton(
                  text: 'Add',
                  onPressed: () {
                    cubit.submit(
                      lostType: selectedLostType!,
                      titlel: nameController.text,
                      caption: descController.text,
                      phoneNumber: phoneController.text,
                      location: locationOfLostFoundController.text,
                      status: widget.type,
                      reward: rewardController.text,
                    );
                  }),
            ],
          ),
        );
      }),
    );
  }
}
