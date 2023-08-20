import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final Function onPressed;
  final Color backgroundColor;
  final String textButton;
  final double fontSize;
  final double? width;
  final Color textColor;
  const CustomTextButton(
      {super.key,
      required this.onPressed,
      required this.backgroundColor,
      required this.textButton,
      required this.textColor,
      required this.fontSize,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: () {
            onPressed();
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
              Size(width ?? 0, 45),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              backgroundColor,
            ),
          ),
          child: Text(
            textButton,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
            ),
          )),
    );
  }
}
