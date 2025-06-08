import 'package:flutter/material.dart';

class ReplacementNavigation extends StatelessWidget {
  final Widget finalScreen;
  final Widget child;

  const ReplacementNavigation({
    Key? key,
    required this.finalScreen,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => finalScreen),
        );
      },
      child: child,
    );
  }
}
