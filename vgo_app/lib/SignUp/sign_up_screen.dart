import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vgo_app/ActivityDetail/widget.dart';
import 'package:vgo_app/SignUp/Widgets/form_sign_up.dart';
import 'package:vgo_app/SignUp/controller/sign_up_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    // init getx for signup controller
    Get.lazyPut(() => SignUPController());

    // device size
    var size = MediaQuery.of(context).size;

    // check keyboard pop up
    var isKeyboardPopUp = MediaQuery.of(context).viewInsets.bottom != 0;

    return WillPopScope(
      onWillPop: () async {
        if (Platform.isAndroid) {
          return onExit();
        } else {
          return false;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                splashRadius: 24,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            width: size.width,
            height: size.height,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo Image

                !isKeyboardPopUp
                    ? (Image.asset(
                        'images/vgo_logo.jpeg',
                        height: size.height * 0.1,
                        width: size.width * 0.4,
                        fit: BoxFit.fill,
                      ))
                    : const SizedBox(),

                // Sign up Form
                SizedBox(
                  height: size.height * 0.70,
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextWidget(
                          text: 'Register', isBold: true, size: 32),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: size.height * 0.60,
                        width: size.width,
                        child: const FormSignUp(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
      ),
    );
  }

  bool onExit() {
    bool isExit = false;
    Get.defaultDialog(
      title: "Are you sure?",
      textConfirm: 'Confirm',
      confirmTextColor: Colors.white,
      content: const Text("You will exit the app."),
      onConfirm: () {
        isExit = true;
      },
      onCancel: () {
        isExit = false;
      },
    );
    return isExit;
  }
}
