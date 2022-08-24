import 'package:flutter/material.dart';

import 'package:vgo_app/utility/buttom.dart';
import 'package:get/get.dart';

// ignore: unused_import
import '../../constants/palette.dart';

class PromotedWidget extends StatefulWidget {
  const PromotedWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<PromotedWidget> createState() => _PromotedWidgetState();
}

class _PromotedWidgetState extends State<PromotedWidget> {
  var isLoading = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.3,
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
          width: 1,
        ),
        image: const DecorationImage(
          image: AssetImage('images/vkirirom-pine-resort.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: Colors.black.withOpacity(0.3),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: size.width / 2,
              height: 80,
              alignment: Alignment.center,
              child: FittedBox(
                child: Text(
                  'Discover More\nActivities',
                  style: TextStyle(
                    fontSize: size.width * 0.07,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20),

            /* TODO:Back to it latter 
            Button(
              title: 'More Details',
              backgroundColor: Palette.primaryColor,
              foregroundColor: Colors.white,
              onTap: () {
                Get.snackbar(
                  "Message",
                  'This Feature is under maintenance.',
                  duration: const Duration(seconds: 1),
                );
              },
            ),
            */
            const Spacer(),
            // SizedBox(
            //   width: size.width * 0.2,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: List.generate(
            //       3,
            //       (index) {
            //         return DotWidget(
            //           isCurrentIndex: index == 0 ? true : false,
            //         );
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
