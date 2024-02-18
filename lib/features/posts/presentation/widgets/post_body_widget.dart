import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lakini_gp/core/utils/assets.dart';
import 'package:lakini_gp/core/utils/styles.dart';
import 'package:lakini_gp/features/posts/presentation/views/post_added.dart';
import 'package:lakini_gp/features/posts/presentation/widgets/add_image_container.dart';
import 'package:lakini_gp/features/posts/presentation/widgets/custom_text_field.dart';
import 'package:lakini_gp/features/register/widgets/custom_auth_button.dart';
import 'package:lakini_gp/features/register/widgets/custom_drop_down_form_field.dart';

class PostBodyWidget extends StatefulWidget {
  const PostBodyWidget(
      {super.key,
      required this.type,
      required this.locationType,
      required this.dropDownHintText});
  final String type;
  final String locationType;
  final String dropDownHintText;

  @override
  State<PostBodyWidget> createState() => _PostBodyWidgetState();
}

class _PostBodyWidgetState extends State<PostBodyWidget> {
  String value = 'reward';
  String? imagePath;
  List<String> imagePaths = [];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.type,
          style: Styles.textStyle18,
        ),
        CustomDropDownFormField(
          icon: Icons.camera_alt,
          hintText: widget.dropDownHintText,
          items: const [
            'Animal',
            'Electronics',
            'Money',
            'Watch',
            'Gold',
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Add photo',
              style: Styles.textStyle18,
            ),
            Text(
              ' (${imagePaths.length}/4)',
              style: Styles.textStyle14.copyWith(color: Colors.grey),
            ),
          ],
        ),
        SingleChildScrollView(
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
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: const Color(0xff0E1823),
                            title: const Text(
                              'Choose Image Source',
                            ),
                            titleTextStyle: Styles.textStyle60
                                .copyWith(fontWeight: FontWeight.bold),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    Navigator.of(context).pop();
                                    String? path =
                                        await pickImage(ImageSource.gallery);
                                    if (path != null) {
                                      setState(() {
                                        imagePaths.add(path);
                                      });
                                    }
                                  },
                                  child: Text(
                                    'Gallery',
                                    style: Styles.textStyle16,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                GestureDetector(
                                  onTap: () async {
                                    Navigator.of(context).pop();
                                    String? path =
                                        await pickImage(ImageSource.camera);
                                    if (path != null) {
                                      setState(() {
                                        imagePaths.add(path);
                                      });
                                    }
                                  },
                                  child: Text(
                                    'Camera',
                                    style: Styles.textStyle16,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
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
        ),
        Text(
          'Add title',
          style: Styles.textStyle18,
        ),
        const CutsomTextField(
          hintText: 'Add Title',
        ),
        Row(
          children: [
            Text(
              'Add caption',
              style: Styles.textStyle18.copyWith(color: Colors.white),
            ),
            Text(
              ' (0/4)',
              style: Styles.textStyle14.copyWith(color: Colors.grey),
            ),
          ],
        ),
        const CutsomTextField(
          hintText: 'Add caption',
        ),
        Text(
          'Your phone',
          style: Styles.textStyle18,
        ),
        const CutsomTextField(
          hintText: '+20 01 789 9348',
          icon: Icons.phone_outlined,
        ),
        Text(
          'Location of ${widget.locationType}',
          style: Styles.textStyle18,
        ),
        const CustomDropDownFormField(
          icon: Icons.location_on_outlined,
          hintText: 'Choose location of lost',
          items: [
            'Alexandria',
            'Cairo',
            'Kafr El-Shikeh',
          ],
        ),
        Text(
          'Location of lost',
          style: Styles.textStyle18,
        ),
        CustomDropDownFormField(
          icon: Icons.location_on_outlined,
          hintText: widget.dropDownHintText,
          items: const [
            'Alexandria',
            'Cairo',
            'Kafr El-Shikeh',
          ],
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
              Container(
                height: height * 0.06,
                width: width * 0.9,
                decoration: BoxDecoration(
                  color: const Color(0xff0E1823),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '0000',
                            hintStyle: Styles.textStyle18
                                .copyWith(color: const Color(0xff555557))),
                      ),
                    ),
                    Text(
                      'EGP',
                      style: Styles.textStyle18,
                    ),
                    const Spacer(),
                  ],
                ),
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
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(7),
                            border: InputBorder.none,
                            hintText: '0000',
                            hintStyle: Styles.textStyle18
                                .copyWith(color: const Color(0xff555557))),
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
              Navigator.pushNamed(context, PostAddedSuccessScreen.id);
            }),
      ],
    );
  }
}
