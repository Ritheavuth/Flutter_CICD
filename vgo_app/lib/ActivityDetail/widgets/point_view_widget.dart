import 'package:flutter/material.dart';
import 'package:vgo_app/constants/palette.dart';
import 'package:vgo_app/utility/text_widget.dart';

class PriceRow extends StatelessWidget {
  const PriceRow({
    Key? key,
    required this.priceText,
    required this.pricePoint,
  }) : super(key: key);
  final String priceText;
  final int pricePoint;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: size.width * 0.6,
            child: TextWidget(
              text: "• $priceText",
              size: 16,
            ),
          ),
          // Point Show
          Container(
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextWidget(
                  text: "+$pricePoint Pt",
                  color: Colors.white,
                  isBold: true,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Palette.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
          )
        ],
      ),
    );
  }
}
