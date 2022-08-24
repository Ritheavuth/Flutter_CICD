import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vgo_app/Welcome/welcome_screen.dart';
import 'package:vgo_app/utility/app_controller.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({Key? key}) : super(key: key);

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  var _isLoad = false;
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _isLoad = true;
      });
      if (_isLoad == true) {
        Future.delayed(const Duration(milliseconds: 1000), () {
          Get.to(
            () => const WelcomeScreen(),
            transition: Transition.fadeIn,
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 800),
          );
        });
      }
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // Getx

    // device size
    var size = MediaQuery.of(context).size;
    AppController().startApp();
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(seconds: 1),
          opacity: _isLoad ? 1 : 0,
          child: Image.asset(
            'images/vgo_logo.jpeg',
            height: size.height * 0.15,
            width: size.width * 0.5,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
