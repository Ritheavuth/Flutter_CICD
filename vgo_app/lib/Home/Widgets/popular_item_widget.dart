import 'package:flutter/material.dart';
import 'package:vgo_app/ActivityDetail/activity_detail_screen.dart';
import 'package:vgo_app/constants/palette.dart';
import 'package:get/get.dart';
import 'package:vgo_app/utility/text_widget.dart';

class PopularItemWidget extends StatelessWidget {
  final dynamic popularActivity;
  const PopularItemWidget({
    Key? key,
    required this.popularActivity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Get.to(
          () => ActivityDetailScreen(activity: popularActivity),
          transition: Transition.downToUp,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 500),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: 125,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  popularActivity['image'],
                  height: 100,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: popularActivity['title'],
                    size: size.width * 0.05,
                    isBold: true,
                  ),
                  TextWidget(
                    text: "It is also suitable for child",
                    size: size.width * 0.03,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star,
                          color: Palette.primaryColor, size: size.width * 0.03),
                      const SizedBox(width: 5),
                      TextWidget(
                          text: "${popularActivity['rating']} Rating",
                          isBold: true,
                          size: size.width * 0.03),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
