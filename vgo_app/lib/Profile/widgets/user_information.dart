import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:vgo_app/Profile/widgets/user_info_row.dart';

class UserInfomation extends StatelessWidget {
  const UserInfomation({
    Key? key,
    required this.phoneNumber,
    required this.email,
  }) : super(key: key);

  final String phoneNumber;
  final String email;

  @override
  Widget build(BuildContext context) {
    var phoneNumber = StringUtils.addCharAtPosition(
        (this.phoneNumber.startsWith('0')
            ? this.phoneNumber
            : '0' + this.phoneNumber),
        '-',
        3,
        repeat: true);
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      height: size.height * .1 / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UserInfoRow(userInfo: email, icon: Icons.email),
          if (phoneNumber.toString().length > 1)
            UserInfoRow(userInfo: phoneNumber, icon: Icons.phone),
        ],
      ),
    );
  }
}
