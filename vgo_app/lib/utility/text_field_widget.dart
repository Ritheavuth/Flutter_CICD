import 'package:flutter/material.dart';
import 'package:vgo_app/ActivityDetail/widget.dart';

// ignore: must_be_immutable
class TextFieldWidgets extends StatelessWidget {
  TextFieldWidgets({
    Key? key,
    required this.hintText,
    this.controller,
    this.type,
    this.label,
  }) : super(key: key);
  final String hintText;
  String? label;
  TextEditingController? controller;
  TextInputType? type;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey.withOpacity(0.5),
        ),
        fillColor: Palette.primaryColor,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Palette.primaryColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
