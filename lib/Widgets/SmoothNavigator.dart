import 'package:flutter/material.dart';

class MyNavigator {
  static void Smooth({
    required BuildContext context,
    required Widget nextScreen,
  }) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => nextScreen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }
}
