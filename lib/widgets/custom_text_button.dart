import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color textColor;
  final double fontSize;
  final Color backgroundColor;
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.textColor = Colors.purple,
    this.backgroundColor = Colors.transparent, 
    this.fontSize=16,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor, fixedSize: const Size(150, 50)),
        child: Text(
          buttonText,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
          ),
        ));
  }
}
//=> Navigator.pushNamed(context, "/signUp")