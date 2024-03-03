import 'package:flutter/material.dart';

class CustomInputDecoration extends InputDecoration {
  final String? hintText;
  final Icon? icon;
  final Icon? prefixIcon;
  final Icon? suffixIcon;

  CustomInputDecoration(
      {this.hintText, this.icon, this.prefixIcon, this.suffixIcon})
      : super(
          hintText: hintText,
          prefixIcon: prefixIcon,
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.amberAccent),
          ),
        );
}
