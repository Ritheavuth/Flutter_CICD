import 'package:flutter/material.dart';
import 'package:vgo_app/ActivityDetail/widgets/circle_star_widget.dart';
import 'package:vgo_app/utility/text_widget.dart';

class StarRating extends StatelessWidget {
  final double rating;
  const StarRating({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            5,
            (index) {
              return CircleStar(
                isFill: index < rating.floor() ? true : false,
              );
            },
          ),
        ),
        TextWidget(text: "$rating Rating", isBold: true)
      ],
    );
  }
}
