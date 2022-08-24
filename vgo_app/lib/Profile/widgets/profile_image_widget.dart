import 'package:flutter/material.dart';
import 'package:vgo_app/Login/widget.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width * 0.25;
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
        image: const DecorationImage(
          image: AssetImage('images/avatar.png'),
          fit: BoxFit.cover,
        ),
        border: Border.all(width: 1, color: Palette.primaryColor),
      ),
    );
  }
}
