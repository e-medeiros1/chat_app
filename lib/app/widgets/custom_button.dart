import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Colors.black87;
    const secondaryColor = Colors.black54;

    return OutlinedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          
          overlayColor: MaterialStateProperty.all(Colors.black12),
          alignment: Alignment.center,
          side: MaterialStateProperty.all(
              const BorderSide(width: 1, color: secondaryColor)),
          padding: MaterialStateProperty.all(const EdgeInsets.only(
              right: 75, left: 75, top: 12.5, bottom: 12.5)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)))),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: primaryColor, fontSize: 16),
      ),
    );
  }
}
