import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:vgo_app/Home/main_home_screen.dart';
import 'package:vgo_app/Login/login_screen.dart';
import 'package:vgo_app/Welcome/controllers/splash_screen_controller.dart';
import 'package:vgo_app/Welcome/widgets/button_icon_widget.dart';
import 'package:vgo_app/utility/or_border.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Device Size
    var size = MediaQuery.of(context).size;

    // checking keyboardload
    var isKeyboardLoad = MediaQuery.of(context).viewInsets.bottom != 0;

    SplashScreenController _splashScreenController =
        Get.find<SplashScreenController>();

    return WillPopScope(
      onWillPop: () async {
        if (Platform.isAndroid) {
          onExit();
        }
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * (isKeyboardLoad ? 0.1 : 0.2),
                ),
                Image.asset(
                  "images/vgo_logo.jpeg",
                  height: size.height * 0.2,
                  width: size.width * 0.8,
                ),
                const Text(
                  "By continuing, you are setting up a vGo account and agree to our User Agreement and Privacy Policy.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: size.height * 0.09,
                ),
                ButtonIconWidget(
                  label: "Continue with Email",
                  imageUrl: "images/mail_icon.png",
                  onTap: () async {
                    await _splashScreenController.getUserDataFromLocalStorage();

                    Get.to(
                      () => _splashScreenController.isNeedLogin
                          ? const LoginScreen()
                          : const MainScreen(),
                      transition: Transition.fadeIn,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 800),
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: OrBorder(
                    width: 30,
                  ),
                ),
                Column(
                  children: [
                    ButtonIconWidget(
                      label: "Continue with Google",
                      imageUrl: "images/google_logo.png",
                      onTap: () {},
                    ),
                    ButtonIconWidget(
                      label: "Continue with Facebook",
                      imageUrl: "images/facbook_logo.png",
                      onTap: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
      ),
    );
  }

  void onExit() {
    Get.defaultDialog(
      title: "Are you sure?",
      textConfirm: 'Confirm',
      confirmTextColor: Colors.white,
      content: const Text("You will exit the app"),
      onConfirm: () {
        SystemNavigator.pop();
      },
      onCancel: () {},
    );
  }
}
