import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: const Center(
              child: Text(
            'Tipster',
            style: TextStyle(
                color: Colors.black, fontSize: 26, fontWeight: FontWeight.w500),
          ))),
    );
  }
}
