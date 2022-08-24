import 'package:flutter/material.dart';
import 'package:vgo_app/Home/widget.dart';
import 'package:vgo_app/Profile/widgets/profile_image_widget.dart';

class UserImageAndName extends StatelessWidget {
  final String username;
  const UserImageAndName({
    Key? key,
    required this.size,
    required this.username,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .1,
      width: size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        children: [
          const ProfileImage(),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FittedBox(
                child: TextWidget(
                  text: username.toUpperCase(),
                  size: size.width * .05,
                  isBold: true,
                  color: Colors.black87,
                ),
              ),
              FittedBox(
                child: TextWidget(
                  text: 'Nationality',
                  size: size.width * .06 / 2,
                  color: Colors.black54,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
