import 'package:flutter/material.dart';

class InputTextCustom extends StatelessWidget {
  final TextEditingController valueController;
  final String hintText;
  final bool obscureText;
  final Color hintColor;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  final IconData? suffixIcon;
  final Function? functionSufixIcon;

  const InputTextCustom({
    Key? key,
    required this.valueController,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.functionSufixIcon,
    required this.keyboardType,
    required this.hintColor,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: valueController,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintColor,
          fontSize: 17,
        ),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: hintColor,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? InkWell(
                onTap: () {
                  if (functionSufixIcon != null) {
                    functionSufixIcon!();
                  }
                },
                child: Icon(
                  suffixIcon,
                  color: hintColor,
                ),
              )
            : null,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: hintColor,
          ),
        ),
        labelStyle: TextStyle(
          color: hintColor,
        ),
      ),
      style: TextStyle(
        color: hintColor,
        fontSize: 20,
      ),
    );
  }
}
