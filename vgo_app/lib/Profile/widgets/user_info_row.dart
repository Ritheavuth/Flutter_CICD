import 'package:flutter/material.dart';
import 'package:vgo_app/ActivityDetail/widget.dart';

class UserInfoRow extends StatelessWidget {
  final String userInfo;
  final IconData icon;
  const UserInfoRow({
    Key? key,
    required this.userInfo,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Palette.primaryColor, size: 20),
        const SizedBox(width: 10),
        TextWidget(text: userInfo, size: 14, color: Colors.black38),
      ],
    );
  }
}
