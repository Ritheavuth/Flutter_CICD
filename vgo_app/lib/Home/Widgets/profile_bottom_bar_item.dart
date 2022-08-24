import 'package:flutter/material.dart';
import 'package:vgo_app/constants/palette.dart';
import 'package:vgo_app/utility/text_widget.dart';

class ProfileBottomBarItem extends StatelessWidget {
  const ProfileBottomBarItem(
      {Key? key,
      required this.isCurrentIndex,
      required this.onTap,
      required this.firstCharacterOfName})
      : super(key: key);
  final String firstCharacterOfName;
  final bool isCurrentIndex;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isCurrentIndex ? Palette.primaryColor : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              child: TextWidget(
                text: firstCharacterOfName,
                color: isCurrentIndex ? Colors.black : Colors.white,
                isBold: true,
              ),
              radius: 16,
              backgroundColor:
                  isCurrentIndex ? Colors.white : Palette.primaryColor,
            ),
            TextWidget(
              text: 'Profile',
              color: isCurrentIndex ? Colors.white : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
