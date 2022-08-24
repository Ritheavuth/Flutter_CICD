import 'package:flutter/material.dart';
import 'package:vgo_app/constants/palette.dart';
import 'package:vgo_app/utility/text_widget.dart';

class DiscountRow extends StatelessWidget {
  const DiscountRow({
    Key? key,
    required this.discountPercent,
    required this.pointMinus,
    required this.progressValue,
    required this.onTap,
  }) : super(key: key);

  final String discountPercent;
  final int pointMinus;
  final double progressValue;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: size.height * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(progressValue >= 100 ? 1 : 0.5),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 6,
              color: Colors.grey,
            ),
            BoxShadow(
              offset: Offset(2, 0),
              blurRadius: 6,
              color: Colors.grey,
            ),
          ],
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // percentage show
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Palette.primaryColor
                            .withOpacity(progressValue >= 100 ? 1 : 0.5),
                      ),
                      child: TextWidget(
                          text: discountPercent, size: 16, color: Colors.white),
                    ),
                    // Minus Point show
                    Row(
                      children: [
                        TextWidget(
                            text: "$pointMinus Pts",
                            size: size.width * 0.1 / 2),
                        const SizedBox(width: 10),
                        Icon(Icons.arrow_forward, size: size.width * 0.04),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Progress Bar
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: LinearProgressIndicator(
                  value: progressValue / 100.0,
                  backgroundColor: Palette.primaryColor.withOpacity(0.5),
                  color: Palette.primaryColor
                      .withOpacity(progressValue >= 100 ? 1 : 0.5),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
