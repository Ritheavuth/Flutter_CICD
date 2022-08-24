import 'package:flutter/material.dart';
import 'package:vgo_app/ActivityDetail/widget.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final bool isClicked;

  const CategoryItem({
    Key? key,
    required this.title,
    required this.isClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 120,
      margin: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          color: isClicked ? Palette.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: !isClicked
              ? Border.all(width: 2, color: Palette.primaryColor)
              : null),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(
            text: title,
            isBold: true,
            color: isClicked ? Colors.white : Colors.black,
            size: 14,
          ),
        ],
      ),
    );
  }
}
