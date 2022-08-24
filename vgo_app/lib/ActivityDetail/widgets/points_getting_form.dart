import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vgo_app/ActivityDetail/controllers/acitvity_detail_controller.dart';
import 'package:vgo_app/constants/palette.dart';
import 'package:vgo_app/utility/text_widget.dart';
import 'package:vgo_app/Validator/check_empty.dart';

class PointGetForm extends StatefulWidget {
  const PointGetForm({
    Key? key,
  }) : super(key: key);

  @override
  State<PointGetForm> createState() => _PointGetFormState();
}

class _PointGetFormState extends State<PointGetForm> {
  var formKey = GlobalKey<FormState>();
  var isPinTextTapped = false;
  int points = 0;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ActivityDetailController());
    // Checking keyboard popup
    var iskeyBoradLoad = MediaQuery.of(context).viewInsets.bottom != 0;
    // Device size
    var size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
      height: !iskeyBoradLoad ? size.height * 0.35 : size.height * .65,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Amount Input
            Container(
              height: 5,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              enableIMEPersonalizedLearning: false,
              onSaved: (value) {
                setState(() {
                  points = int.parse(value!);
                });
              },
              validator: (value) {
                return EmptyThings.checkEmptyField(value);
              },
              keyboardType: const TextInputType.numberWithOptions(signed: true),
              decoration: InputDecoration(
                hintText: 'Enter amount of spending',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: Palette.primaryColor,
                    width: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Pin Input
            TextFormField(
              onTap: () async {
                setState(() {
                  isPinTextTapped = true;
                });
              },
              validator: (value) {
                if (value.toString() != '2022') {
                  return 'your pin is not correct ';
                } else {
                  return EmptyThings.checkEmptyField(value);
                }
              },
              obscureText: true,
              keyboardType: const TextInputType.numberWithOptions(signed: true),
              decoration: InputDecoration(
                hintText: 'Enter the pin',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: Palette.primaryColor,
                    width: 1,
                  ),
                ),
              ),
            ),
            if (!isPinTextTapped) const SizedBox(height: 20),
            if (isPinTextTapped)
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(bottom: 10, top: 10, left: 3),
                child: const TextWidget(
                  text: 'The pin number will provide by admin',
                  size: 14,
                  isBold: true,
                ),
              ),
            ElevatedButton(
              onPressed: _onSumit,
              child: Container(
                width: size.width,
                height: 60,
                alignment: Alignment.center,
                child: const TextWidget(
                  text: 'Get Points ',
                  color: Colors.white,
                  size: 24,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Palette.primaryColor,
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              height: !iskeyBoradLoad ? 0 : 150,
            ),
          ],
        ),
      ),
    );
  }

  _onSumit() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    formKey.currentState!.save();
    // Get.find<ActivityDetailController>().getIdToken();
    Get.find<ActivityDetailController>().addPoint(points).then((value) {
      Get.back();
      Get.snackbar(
        'Get Point',
        'Your already get $points points',
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
    });
  }
}
