import 'package:flutter/material.dart';
import 'package:vgo_app/Login/Widget/login_email_input.dart';
import 'package:vgo_app/Login/Widget/login_password_input.dart';
import 'package:vgo_app/Login/controller/login_controller.dart';
import 'package:vgo_app/Login/forgetting_password_screen.dart';
import 'package:vgo_app/Login/widget.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var loginFormkey = GlobalKey<FormState>();
  Map<String, String> userData = {
    'email': '',
    'password': '',
  };

  LoginController loginController = Get.put(LoginController());

  _onSubmit() {
    if (!loginFormkey.currentState!.validate()) {
      return;
    }
    loginFormkey.currentState!.save();

    Get.snackbar(
      '',
      'Logging in ...',
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 10,
      duration: const Duration(milliseconds: 500),
      animationDuration: const Duration(milliseconds: 500),
    );
    loginController
        .login(
      userData['email'] as String,
      userData['password'] as String,
    )
        .then((value) {
      Get.snackbar(
        '',
        'Log in Success...',
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        duration: const Duration(seconds: 1),
        animationDuration: const Duration(seconds: 1),
      );
      loginController.goto(const MainScreen());
    }).catchError((err) {
      // ignore: avoid_print
      print('coudln\'t login in $err');
      Get.snackbar(
        '',
        '$err',
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        duration: const Duration(seconds: 1),
        animationDuration: const Duration(seconds: 1),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SizedBox(
          height: size.height * 0.5,
          width: size.width,
          child: Form(
            key: loginFormkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                LogInEmailInput(
                  onSaved: (value) {
                    userData['email'] = value as String;
                  },
                ),
                const SizedBox(height: 20),
                LogInPasswordInput(
                  onSaved: (value) {
                    userData['password'] = value as String;
                  },
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => const ForgotPasswordScreen());
                  },
                  child: const TextWidget(
                    text: "Forgot password?",
                    color: Palette.primaryColor,
                    isBold: true,
                    size: 14,
                  ),
                ),
                // Sign In and Sign Out Button
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ButtonWidget(
                      title: "Sign in",
                      onPressed: _onSubmit,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TextWidget(
                          text: "Don't have an account? ",
                          size: 14,
                        ),
                        TextButton(
                          child: const TextWidget(
                            text: 'Register',
                            isBold: true,
                            size: 14,
                          ),
                          onPressed: () {
                            Get.to(
                              () => const SignUpScreen(),
                              duration: const Duration(milliseconds: 500),
                              transition: Transition.fadeIn,
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
