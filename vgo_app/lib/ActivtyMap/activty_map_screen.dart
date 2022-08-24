import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vgo_app/utility/text_widget.dart';

class ActivityMapScreen extends StatelessWidget {
  const ActivityMapScreen({Key? key}) : super(key: key);

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
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          splashRadius: 18,
        ),
      ),
      body: const Center(
        child: TextWidget(
          text: 'coming soon... ',
          size: 16,
        ),
      ),
    );
  }
}
