import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lakini_gp/core/utils/styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
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
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool showPwd = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          cursorColor: mainColor,
          maxLines: 1,
          controller: widget.textController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16),
            hintText: widget.hintText,
            hintStyle: Styles.textStyle16.copyWith(color: Colors.grey),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            prefixIcon: Icon(
              widget.icon,
              color: Colors.grey,
            ),
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
