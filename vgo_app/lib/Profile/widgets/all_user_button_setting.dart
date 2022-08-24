import 'package:flutter/material.dart';
import 'package:vgo_app/Profile/widgets/profile_button.dart';
import 'package:get/get.dart';
import 'package:vgo_app/Setting/setting_screen.dart';

class AllUserButtonSetting extends StatelessWidget {
  const AllUserButtonSetting({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: size.height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ProfileButton(
            icon: Icons.account_balance_wallet,
            title: 'Payment',
            onPressed: () {
              Get.to(() => const SettingScreen());
            },
          ),
          ProfileButton(
            icon: Icons.fact_check,
            title: 'Term & Conditions / Privacy',
            onPressed: () {
              Get.to(() => const SettingScreen());
            },
          ),
          ProfileButton(
            icon: Icons.settings,
            title: 'Setting',
            onPressed: () {
              Get.to(() => const SettingScreen());
            },
          ),
        ],
      ),
    );
  }
}
