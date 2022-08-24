import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vgo_app/Login/Widget/login_form.dart';
import 'package:vgo_app/Login/controller/login_controller.dart';
import 'package:vgo_app/Welcome/welcome_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginController());
    // Device Size
    var size = MediaQuery.of(context).size;
    var isKeyboardLoad = MediaQuery.of(context).viewInsets.bottom != 0;
    return WillPopScope(
      onWillPop: () async {
        if (Platform.isAndroid) {
          Get.to(() => const WelcomeScreen());
          return false;
        } else {
          return false;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  height: size.height * (isKeyboardLoad ? 0.04 : 0.15),
                  curve: Curves.easeIn,
                ),
                // Logo Image
                Image.asset(
                  "images/vgo_logo.jpeg",
                  height: size.height * 0.2,
                  width: size.width * 0.5,
                ),
                // Form Field

                const LoginForm(),
              ],
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
