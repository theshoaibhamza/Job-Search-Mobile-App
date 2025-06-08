import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFormField extends StatelessWidget {
  MyTextFormField({
    super.key,
    required this.height,
    required this.width,
    required this.hintText,
    required this.controller,
    required this.textInputType,
    required this.isNumeric,
  });

  double height;
  double width;
  String hintText;
  TextEditingController controller;
  TextInputType textInputType;
  bool isNumeric;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double totalHeight = size.height;
    double totalWidth = size.width;
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: TextFormField(
          maxLines: null,

          inputFormatters:
              isNumeric
                  ? [
                    FilteringTextInputFormatter
                        .digitsOnly, // Allows only numbers
                  ]
                  : [],
          keyboardType: textInputType,
          controller: controller,
          cursorColor: const Color.fromARGB(255, 86, 86, 86),
          cursorHeight: 20,
          cursorErrorColor: Colors.red,
          cursorWidth: 2,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(
              fontSize: 15,
              color: const Color.fromARGB(255, 131, 131, 131),
            ),
            hintText: hintText,
          ),
        ),
      ),
      height: totalHeight * height,
      width: totalWidth * width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 1,
          color: const Color.fromARGB(255, 139, 139, 139),
        ),
      ),
    );
  }
}
