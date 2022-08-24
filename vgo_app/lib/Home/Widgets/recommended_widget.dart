import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vgo_app/ActivityDetail/activity_detail_screen.dart';

import 'package:vgo_app/constants/palette.dart';
import 'package:vgo_app/utility/text_widget.dart';

class RecommededWidget extends StatelessWidget {
  final List activties;
  const RecommededWidget({
    Key? key,
    required this.activties,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      margin: const EdgeInsets.only(top: 20, left: 20),
      // color: Colors.green,
      child: ListView.builder(
        itemCount: activties.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RecommedItemImage(
                imageUrl: activties[index]['image'],
                rating: activties[index]['rating'],
                activity: activties[index],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextWidget(
                  text: activties[index]['title'],
                  size: 16,
                  isBold: true,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class RecommedItemImage extends StatelessWidget {
  final String imageUrl;
  final double rating;
  final dynamic activity;
  const RecommedItemImage({
    Key? key,
    required this.imageUrl,
    required this.rating,
    required this.activity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => ActivityDetailScreen(activity: activity),
          transition: Transition.downToUp,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 300),
        );
      },
      child: Container(
        width: 225,
        height: 125,
        margin: const EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imageUrl,
                width: 250,
                height: 125,
                fit: BoxFit.cover,
                scale: 1,
              ),
            ),
            // Title
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Container(
                padding: const EdgeInsets.all(5),
                height: 25,
                width: 50,
                decoration: BoxDecoration(
                  color: Palette.primaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    ),
                    TextWidget(
                      text: "$rating",
                      color: Colors.white,
                      isBold: true,
                      size: 12,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
