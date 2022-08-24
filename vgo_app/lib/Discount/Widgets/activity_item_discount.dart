import 'package:flutter/material.dart';
import 'package:vgo_app/Discount/Widgets/activity_image.dart';
import 'package:vgo_app/Login/widget.dart';

class ActivityItemDiscount extends StatelessWidget {
  const ActivityItemDiscount({
    Key? key,
    this.imageUrl = "images/horse-riding.JPG",
    required this.pointMinus,
    this.isSelected = false,
    this.activityTitle = "Zipline",
  }) : super(key: key);

  final String imageUrl;
  final int pointMinus;
  final String activityTitle;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 75,
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(0.3),
        border: Border.all(
          width: isSelected ? 2 : 1,
          color:
              isSelected ? Palette.primaryColor : Colors.grey.withOpacity(0.5),
        ),
      ),
      child: Stack(
        children: [
          // Image and title

          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                // Image
                ActivityImage(imageUrl: imageUrl),
                const SizedBox(width: 12),
                // Title
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: SizedBox(
                    width: size.width * 0.5,
                    child: Text(
                      activityTitle,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Minus Point
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.all(8),
              width: 50,
              child: FittedBox(
                  child:
                      TextWidget(text: '-${pointMinus}pt', color: Colors.red)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
