import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vgo_app/Login/login_screen.dart';
import 'package:vgo_app/Login/widget.dart';
import 'package:vgo_app/Profile/controller/profile_screen_controller.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: ElevatedButton(
        onPressed: () {
          Get.defaultDialog(
            title: 'Are You Sure ?',
            radius: 6,
            content: const TextWidget(
                text: 'You will be log out from this account! '),
            onCancel: () {},
            onConfirm: logout,
            textConfirm: 'Confirm',
            confirmTextColor: Colors.white,
            cancelTextColor: Colors.red,
            buttonColor: Palette.primaryColor,
          );
        },
        child: SizedBox(
          height: size.height * 0.06,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.logout,
                    color: Colors.white, size: size.width * 0.1 / 2),
                const SizedBox(width: 12),
                TextWidget(
                    text: 'Log Out ',
                    color: Colors.white,
                    size: size.width * 0.1 / 2)
              ],
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.red.withOpacity(0.9),
        ),
      ),
    );
  }

  logout() {
    Get.find<ProfileScreenController>().signOut().then((value) {
      Get.to(
        () => const LoginScreen(),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 400),
      );
    });
  }
}
