import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vgo_app/Discount/Widgets/activity_item_discount.dart';
import 'package:vgo_app/Discount/controller/discount_controller.dart';
// import 'package:vgo_app/Discount/discount_screen.dart';
import 'package:vgo_app/constants/palette.dart';
import 'package:vgo_app/utility/text_widget.dart';

class ActivityListDiscountScreen extends StatefulWidget {
  final int totalPoints;
  final Map<String, dynamic> activitiesCouldDiscount;

  const ActivityListDiscountScreen({
    Key? key,
    required this.activitiesCouldDiscount,
    required this.totalPoints,
  }) : super(key: key);

  @override
  State<ActivityListDiscountScreen> createState() =>
      _ActivityListDiscountScreenState();
}

class _ActivityListDiscountScreenState
    extends State<ActivityListDiscountScreen> {
  int isCurrentIndex = 0;
  var isLoading = false;
  var isTapped = false;

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    DiscountScreenController discountController =
        Get.put(DiscountScreenController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: isTapped
              ? null
              : () async {
                  Get.back();
                  setState(() {
                    isTapped = true;
                  });
                  await Future.delayed(const Duration(milliseconds: 1000), () {
                    setState(() {
                      isTapped = false;
                    });
                  });
                },
          icon: Icon(
            Icons.arrow_back,
            color: isTapped ? Colors.grey : Colors.black,
          ),
          splashRadius: 24,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextWidget(
              text: "Discount ${widget.activitiesCouldDiscount['coupon']}",
              isBold: true,
              size: 24,
            ),
            const SizedBox(height: 20),
            TextWidget(
              text: widget.activitiesCouldDiscount['description'],
              size: 16,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: widget
                    .activitiesCouldDiscount['activityCouldDiscounts'].length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        isCurrentIndex = index;
                      });
                    },
                    child: ActivityItemDiscount(
                      isSelected: isCurrentIndex == index ? true : false,
                      pointMinus:
                          widget.activitiesCouldDiscount['pointToDiscount'],
                      imageUrl: widget
                              .activitiesCouldDiscount['activityCouldDiscounts']
                          [index]['image'],
                      activityTitle: widget
                              .activitiesCouldDiscount['activityCouldDiscounts']
                          [index]['activity'],
                    ),
                  );
                },
              ),
            ),
            Container(height: 70, color: Colors.transparent),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: InkWell(
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: (widget.totalPoints >=
                          widget.activitiesCouldDiscount['pointToDiscount'] &&
                      !isLoading)
                  ? Palette.primaryColor
                  : Palette.primaryColor.withOpacity(.5),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: const TextWidget(
              text: "Get Discount",
              size: 24,
              color: Colors.white,
              isBold: true,
            ),
          ),
          onTap: (widget.totalPoints >=
                      widget.activitiesCouldDiscount['pointToDiscount'] &&
                  !isLoading)
              ? () {
                  Get.defaultDialog(
                    title: 'Are You Sure?',
                    textConfirm: 'Confirm',
                    confirmTextColor: Colors.white,
                    titlePadding: const EdgeInsets.symmetric(vertical: 10),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    radius: 10,
                    buttonColor: Palette.primaryColor,
                    cancelTextColor: Palette.primaryColor,
                    content: Text(
                        'You will get discount ${widget.activitiesCouldDiscount['coupon']} for ${widget.activitiesCouldDiscount['activityCouldDiscounts'][isCurrentIndex]['activity']}'),
                    onConfirm: () async {
                      setState(() {
                        isLoading = true;
                      });
                      Get.back();

                      await discountController.getDiscount(
                          widget.activitiesCouldDiscount['pointToDiscount']);
                      await discountController.addDiscountData(
                          widget.activitiesCouldDiscount['pointToDiscount'],
                          widget.activitiesCouldDiscount[
                                  'activityCouldDiscounts'][isCurrentIndex]
                              ['activity'],
                          widget.activitiesCouldDiscount['coupon']);
                      await Future.delayed(
                        const Duration(
                          milliseconds: 500,
                        ),
                      );

                      Get.back();
                      setState(() {
                        isLoading = false;
                      });
                    },
                    onCancel: () {},
                  );
                }
              : null,
        ),
      ),
    );
  }
}
