import 'package:flutter/material.dart';

class ActivityImage extends StatelessWidget {
  const ActivityImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(
            imageUrl,
          ),
          fit: BoxFit.cover,
          alignment: Alignment.bottomCenter,
          scale: 8.0,
        ),
        border: Border.all(width: 2, color: Colors.white),
      ),
    );
  }
}
