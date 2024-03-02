import 'package:flutter/material.dart';

class CustomInputDecoration extends InputDecoration {
  final String? hintText;
  final Icon? icon;

  CustomInputDecoration({
    this.hintText,
    this.icon,
  }) : super(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.amberAccent),
          ),
        );
}
