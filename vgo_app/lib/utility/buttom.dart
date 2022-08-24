import 'package:flutter/material.dart';
import 'package:vgo_app/utility/text_widget.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  Button({
    Key? key,
    required this.title,
    required this.backgroundColor,
    required this.foregroundColor,
    this.size = 14,
    required this.onTap,
    this.isTitleBold = false,
  }) : super(key: key);

  final String title;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback onTap;
  final bool isTitleBold;
  double size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: TextWidget(
        text: title,
        size: size,
        color: foregroundColor,
        isBold: isTitleBold,
      ),
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
      ),
    );
  }
}
