import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/styles.dart';

class ImagePickerDialog extends StatelessWidget {
  final Function(ImageSource) onImageSourceSelected;

  const ImagePickerDialog({Key? key, required this.onImageSourceSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xff0E1823),
      title: const Text(
        'Choose Image Source',
      ),
      titleTextStyle: Styles.textStyle60.copyWith(fontWeight: FontWeight.bold),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () async {
              Navigator.of(context).pop();
              onImageSourceSelected(ImageSource.gallery);
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
              onImageSourceSelected(ImageSource.camera);
            },
            child: Text(
              'Camera',
              style: Styles.textStyle16,
            ),
          ),
        ],
      ),
    );
  }
}
