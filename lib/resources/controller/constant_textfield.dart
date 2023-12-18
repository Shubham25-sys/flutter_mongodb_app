import 'package:flutter/material.dart';

import '../colors_const.dart';
import '../values_const.dart';

class ConstantTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  final bool obscureText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator; // Validator function added
  final InputDecoration? decoration;

  ConstantTextField({
    required this.controller,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.decoration, // Validator function parameter
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color:ColorManager.black),
      cursorColor: ColorManager.black,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator, // Validator function assigned
      decoration: InputDecoration(
        labelStyle: TextStyle(color: ColorManager.black),
        hintStyle: TextStyle(color: ColorManager.gray),
        labelText: labelText,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.black,
          ),
        ),
      ),
    );
  }
}
