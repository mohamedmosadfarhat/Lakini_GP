import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lakini_gp/core/utils/styles.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.icon,
      required this.hintText,
      this.isPassword = false,
      required this.validator,
      required this.textController});
  final IconData icon;
  final String hintText;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController textController;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPwd = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: widget.textController,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: Styles.textStyle16,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            prefixIcon: Icon(widget.icon),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPwd = !showPwd;
                      });
                    },
                    icon:
                        Icon(showPwd ? Icons.visibility : Icons.visibility_off))
                : null,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: mainColor),
            ),
          ),
          obscureText: widget.isPassword && !showPwd,
          validator: widget.validator,
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
