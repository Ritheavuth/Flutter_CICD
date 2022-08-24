import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vgo_app/Discount/controller/activity_list_discount_controller.dart';
import 'package:vgo_app/Discount/controller/discount_controller.dart';
import 'package:vgo_app/Discount/widget.dart';

// ignore: must_be_immutable
class DiscountScreen extends StatefulWidget {
  const DiscountScreen({Key? key}) : super(key: key);

  @override
  State<DiscountScreen> createState() => _DiscountScreenState();
}

class _DiscountScreenState extends State<DiscountScreen> {
  var isLoading = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: const TextWidget(
            text: "My Point(s)", isBold: true, size: 24, color: Colors.white),
        backgroundColor: Palette.primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            // Top Part
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: size.width,
                height: size.height * 0.25,
                padding: EdgeInsets.all(size.width * .08),
                alignment: Alignment.center,
                child: SafeArea(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: Get.find<DiscountScreenController>().userPoints,
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapShot) {
                        if (snapShot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        } else if (snapShot.hasData) {
                          var data = snapShot.data!.docs
                              .map((DocumentSnapshot document) {
                            var currentData = document.data();
                            return currentData as Map<String, dynamic>;
                          }).toList();
                          int points = data[0]['points'] as int;

                          return RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                textSpan(
                                  text: "${points}pt" +
                                      (points > 1 ? "s" : "") +
                                      "\n",
                                  isBold: true,
                                  size: size.width * 0.1,
                                ),
                                textSpan(
                                  text: "Earn more points for more discounts!",
                                  size: size.width * 0.03,
                                )
                              ],
                            ),
                          );
                        } else {
                          return const Text('Something was wrong');
                        }
                      }),
                ),
              ),
            ),
            // Bottom Part
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: size.width,
                height: size.height * 0.6,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: "Discount Lists",
                        size: size.width * 0.1 / 2,
                      ),
                      const SizedBox(height: 10),
                      // Discount List Widget

                      StreamBuilder<QuerySnapshot>(
                          stream:
                              Get.find<DiscountScreenController>().userPoints,
                          builder: (context, snapShot) {
                            if (snapShot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              );
                            } else if (snapShot.hasData) {
                              var data = snapShot.data!.docs
                                  .map((DocumentSnapshot document) {
                                var currentData = document.data();
                                return currentData as Map<String, dynamic>;
                              }).toList();
                              int points = data[0]['points'] as int;

                              return GetX<ActivityDiscountController>(
                                builder: (controller) {
                                  var activityCouldDiscount =
                                      controller.activityDiscount;
                                  return SizedBox(
                                    height: size.height * 0.7,
                                    child: ListView.builder(
                                      itemCount: activityCouldDiscount.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: DiscountRow(
                                            discountPercent:
                                                activityCouldDiscount[index]
                                                    ['coupon'],
                                            pointMinus:
                                                activityCouldDiscount[index]
                                                    ['pointToDiscount'],
                                            progressValue: points *
                                                100 /
                                                activityCouldDiscount[index]
                                                    ['pointToDiscount'],
                                            onTap: () {
                                              Get.to(
                                                () =>
                                                    ActivityListDiscountScreen(
                                                  activitiesCouldDiscount:
                                                      activityCouldDiscount[
                                                          index],
                                                  totalPoints: points,
                                                ),
                                                transition:
                                                    Transition.rightToLeft,
                                                duration: const Duration(
                                                    milliseconds: 300),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            } else {
                              return const Text("Something Went Wrong");
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  TextSpan textSpan({
    required String text,
    Color color = Colors.white,
    double size = 14,
    bool isBold = false,
  }) {
    return TextSpan(
      text: text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontFamily: "Lato",
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
/*
                           */