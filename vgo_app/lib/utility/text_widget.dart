import 'package:flutter/material.dart';

import 'package:vgo_app/constants/palette.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
    required this.text,
    this.isBold = false,
    this.size = Palette.defaultTextSize,
    this.color = Colors.black,
  }) : super(key: key);

  final String text;
  final bool isBold;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
