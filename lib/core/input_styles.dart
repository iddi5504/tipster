import 'package:flutter/material.dart';

class CustomInputDecoration extends InputDecoration {
  @override
  final String? hintText;
  @override
  final Icon? icon;
  @override
  final Icon? prefixIcon;
  @override
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
