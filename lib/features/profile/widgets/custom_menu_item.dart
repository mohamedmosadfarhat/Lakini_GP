import 'package:flutter/material.dart';

class CustomMenuItem extends StatelessWidget {
  const CustomMenuItem(
      {super.key,
      required this.title,
      required this.prefixIcon,
      this.postIcon,
      required this.prefixIconColor,
      required this.onTab,
      this.trailingWidget});

  final String title;
  final IconData prefixIcon;
  final IconData? postIcon;
  final Color prefixIconColor;
  final void Function()? onTab;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundColor: prefixIconColor,
        child: Icon(
          prefixIcon,
          color: Colors.white,
        ),
      ),
      trailing: trailingWidget ??
          Icon(
            postIcon,
            color: const Color(0xffAFADAD),
          ),
      onTap: onTab,
    );
  }
}
