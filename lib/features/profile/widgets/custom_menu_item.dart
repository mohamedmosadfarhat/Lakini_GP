import 'package:flutter/material.dart';
import 'package:lakini_gp/core/utils/styles.dart';

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
      title: Text(
        title,
        style: Styles.textStyle16.copyWith(
          color: title == "Logout" || title == "Delete Account"
              ? Colors.red
              : Colors.white,
        ),
      ),
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
