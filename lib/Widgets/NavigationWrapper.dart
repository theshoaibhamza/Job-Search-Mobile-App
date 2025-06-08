import 'package:flutter/material.dart';

class NavigationWrapper extends StatelessWidget {
  final Widget nextScreen;
  final Widget child;

  const NavigationWrapper({
    Key? key,
    required this.nextScreen,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextScreen),
        );
      },
      child: child,
    );
  }
}
