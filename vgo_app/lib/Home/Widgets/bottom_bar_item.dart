import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vgo_app/constants/palette.dart';
import 'package:vgo_app/utility/text_widget.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem({
    Key? key,
    required this.isCurrentIndex,
    required this.title,
    required this.iconUrl,
    required this.onTap,
  }) : super(key: key);

  final bool isCurrentIndex;
  final String title;
  final String iconUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width * .15,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isCurrentIndex ? Palette.primaryColor : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              iconUrl,
              color: isCurrentIndex ? Colors.white : Colors.grey,
              width: size.width * .1 / 2,
              height: size.width * .1 / 2,
            ),
            FittedBox(
              child: TextWidget(
                  text: title,
                  color: isCurrentIndex ? Colors.white : Colors.grey,
                  size: size.width * .06 / 2),
            ),
          ],
        ),
      ),
    );
  }
}
