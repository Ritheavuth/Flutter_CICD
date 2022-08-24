import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vgo_app/ActivityDetail/activity_detail_screen.dart';
import 'package:vgo_app/Home/widget.dart';

class ActivityItem extends StatelessWidget {
  final dynamic activity;

  const ActivityItem({
    Key? key,
    required this.deviceSize,
    required this.activity,
  }) : super(key: key);

  final Size deviceSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => ActivityDetailScreen(activity: activity),
          transition: Transition.downToUp,
          duration: const Duration(milliseconds: 300),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: deviceSize.width,
        height: deviceSize.height * .18,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(activity['image']),
            fit: BoxFit.cover,
            scale: 8.0,
            alignment: Alignment.center,
          ),
        ),
        child: Container(
          width: deviceSize.width,
          height: deviceSize.height * .07,
          child: FittedBox(
            child: TextWidget(
              text: activity['title'],
              size: deviceSize.width * .1 / 2,
              isBold: true,
              color: Colors.white,
            ),
          ),
          padding: const EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.1, 0.9],
              colors: [
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0.6),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
