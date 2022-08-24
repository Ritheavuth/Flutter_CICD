import 'package:flutter/material.dart';
import 'package:vgo_app/constants/palette.dart';

class CircleStar extends StatelessWidget {
  const CircleStar({Key? key, this.isFill = false}) : super(key: key);

  final bool isFill;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isFill ? Palette.primaryColor : null,
        border: isFill
            ? null
            : Border.all(
                width: 1,
                color: Palette.primaryColor,
              ),
      ),
    );
  }
}
