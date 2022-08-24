import 'package:flutter/material.dart';
import 'package:vgo_app/utility/text_widget.dart';

class OrBorder extends StatelessWidget {
  const OrBorder({Key? key, required this.width}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.3,
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: width,
            height: 2,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const TextWidget(
            text: "or",
            size: 14,
            color: Colors.grey,
          ),
          Container(
            width: width,
            height: 2,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
