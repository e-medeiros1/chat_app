import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController textEditingController;

  const CustomTextField(
      {required this.textEditingController, required this.hintText, Key? key})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool pwdVisibility = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.black54,
      decoration: InputDecoration(
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black54,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      validator: (val) {
        if (val!.isEmpty) {
          return 'Email is cannot be empty';
        }
        return null;
      },
    );
  }
}
