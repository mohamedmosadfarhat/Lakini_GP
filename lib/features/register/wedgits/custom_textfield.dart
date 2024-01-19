import 'package:flutter/material.dart';
import 'package:lakini_gp/core/utils/styles.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController textController = TextEditingController();
  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: textController,
            decoration: const InputDecoration(
              hintText: 'enter your text',
              hintStyle: Styles.textStyle16,
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: mainColor),
              ),
            ),
            obscureText: isPassword,
          ),
        ],
      ),
    );
  }
}
