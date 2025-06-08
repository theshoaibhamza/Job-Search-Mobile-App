import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  MyButton({
    super.key,
    required this.height,
    required this.width,
    required this.buttonColor,
    required this.child,
    required this.onTap,
  });

  double height;
  double width;
  VoidCallback onTap;
  Color buttonColor;
  Widget child;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double totalHeight = size.height;
    double totalWidth = size.width;
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        child: Center(child: widget.child),
        height: totalHeight * widget.height,
        width: totalWidth * widget.width,
        decoration: BoxDecoration(
          color: widget.buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
