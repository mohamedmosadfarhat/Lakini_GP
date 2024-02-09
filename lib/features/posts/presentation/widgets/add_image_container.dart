import 'dart:io';

import 'package:flutter/material.dart';

class AddImageContainer extends StatelessWidget {
  final String? imagePath;
  final VoidCallback? onDelete;
  final bool addIcon;
  final Widget? widgetChild;

  const AddImageContainer({
    Key? key,
    this.imagePath,
    this.onDelete,
    this.addIcon = false,
    this.widgetChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, top: 8, right: 8),
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
        color: const Color(0xff0E1823),
        borderRadius: BorderRadius.circular(8),
      ),
      child: imagePath != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                children: [
                  if (imagePath != null)
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Image.file(
                        File(imagePath!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  if (addIcon)
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_photo_alternate_outlined,
                        size: 24,
                        color: Colors.grey,
                      ),
                    ),
                  if (onDelete != null)
                    Positioned(
                      top: 4,
                      right: 4,
                      child: GestureDetector(
                        onTap: onDelete,
                        child: const Icon(
                          Icons.delete_forever,
                          color: Color(0xffEA4335),
                          size: 18,
                        ),
                      ),
                    ),
                ],
              ),
            )
          : widgetChild,
    );
  }
}
