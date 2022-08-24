import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vgo_app/Activity/activity_screen.dart';

import 'package:vgo_app/Discount/controller/activity_list_discount_controller.dart';
import 'package:vgo_app/Discount/controller/discount_controller.dart';
import 'package:vgo_app/Discount/discount_screen.dart';
import 'package:vgo_app/Home/Widgets/bottom_bar_item.dart';
import 'package:vgo_app/Home/controller/home_screen_controller.dart';
import 'package:vgo_app/Home/home_screen.dart';

import 'package:vgo_app/Profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var page = [
    const HomeScreen(),
    const ActiviyScreen(),
    const DiscountScreen(),
    const ProfileScreen()
  ];

  @override
  void initState() {
    super.initState();
    Get.find<HomeScreenController>().getDataFromJson();
    Get.find<ActivityDiscountController>().getDataFromJson();
  }

  var curIndex = 0;
  @override
  Widget build(BuildContext context) {
    // Device Size
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        if (Platform.isAndroid) {
          onExit();
        }
        return false;
      },
      child: Scaffold(
        body: page[curIndex],
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: Container(
          width: size.width,
          height: 70,
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 30),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomBarItem(
                isCurrentIndex: curIndex == 0,
                title: 'Home',
                iconUrl: 'assets/icons/home_icon.svg',
                onTap: () {
                  setCurrentIndex(0);
                },
              ),
              BottomBarItem(
                isCurrentIndex: curIndex == 1,
                title: 'Activity',
                iconUrl: 'assets/icons/activity_icon.svg',
                onTap: () {
                  setCurrentIndex(1);
                },
              ),
              BottomBarItem(
                isCurrentIndex: curIndex == 2,
                title: 'Discount',
                iconUrl: 'assets/icons/discount_icon.svg',
                onTap: () async {
                  setCurrentIndex(2);
                  await Get.find<DiscountScreenController>().getPoint();
                },
              ),
              BottomBarItem(
                isCurrentIndex: curIndex == 3,
                title: 'Profile',
                iconUrl: 'assets/icons/profile-1_icon.svg',
                onTap: () async {
                  setCurrentIndex(3);
                },
              ),
              // ProfileBottomBarItem(
              //   firstCharacterOfName: name.toUpperCase(),
              //   isCurrentIndex: curIndex == 3,
              //   onTap: () {
              //     setCurrentIndex(3);
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }

  void setCurrentIndex(int index) {
    setState(() {
      curIndex = index;
    });
  }

  void onExit() {
    Get.defaultDialog(
      title: "Are you sure?",
      textConfirm: 'Confirm',
      confirmTextColor: Colors.white,
      content: const Text("You will exit the app!"),
      onConfirm: () {
        SystemNavigator.pop();
      },
      onCancel: () {},
    );
  }
}
