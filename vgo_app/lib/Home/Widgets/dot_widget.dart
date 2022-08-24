import 'package:flutter/material.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({
    Key? key,
    this.isCurrentIndex = true,
  }) : super(key: key);
  final bool isCurrentIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCurrentIndex ? Colors.white : null,
        border: Border.all(
          width: 1,
          color: Colors.white,
        ),
      ),
    );
  }
}
