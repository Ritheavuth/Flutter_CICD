import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditingProfileScreen extends StatelessWidget {
  const EditingProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.cancel, color: Colors.black),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          child: const Text(
            "This Screen is under maintenance. ",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
