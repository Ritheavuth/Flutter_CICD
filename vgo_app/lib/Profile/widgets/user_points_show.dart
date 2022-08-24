import 'package:flutter/material.dart';
import 'package:vgo_app/ActivityDetail/widget.dart';

class UserPointShow extends StatelessWidget {
  final Size size;
  final int points;
  const UserPointShow({
    Key? key,
    required this.size,
    required this.points,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: 125,
      child: Row(
        children: [
          Container(
            // height: size.height * .2,
            width: size.width * .5,
            alignment: Alignment.center,
            height: size.height * 0.1 + 10,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.black38, width: 1),
                right: BorderSide(color: Colors.black38, width: 1),
                bottom: BorderSide(color: Colors.black38, width: 1),
              ),
            ),
            child: Text(
              '$points\n Points',
              style: TextStyle(
                color: Palette.primaryColor,
                fontSize: size.width * 0.05,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            // height: size.height * .2,
            height: size.height * 0.1 + 10,
            width: size.width * .5,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.black38, width: 1),
                // right: BorderSide(color: Colors.black38, width: 1),
                bottom: BorderSide(color: Colors.black38, width: 1),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              '0\n Activities',
              style: TextStyle(
                color: Palette.primaryColor,
                fontSize: size.width * 0.05,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
