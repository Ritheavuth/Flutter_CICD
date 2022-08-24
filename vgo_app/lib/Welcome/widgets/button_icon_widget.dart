import 'package:flutter/material.dart';
import 'package:vgo_app/utility/text_widget.dart';

class ButtonIconWidget extends StatelessWidget {
  const ButtonIconWidget({
    Key? key,
    required this.label,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);
  final String label;
  final String imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            Image.asset(
              imageUrl,
              width: 24,
              height: 24,
            ),
            SizedBox(
              width: size.width * 0.1,
            ),
            TextWidget(text: label, size: 14),
          ],
        ),
      ),
    );
  }
}
