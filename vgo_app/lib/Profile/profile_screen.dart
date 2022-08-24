import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vgo_app/Profile/editing_profile_screen.dart';

import 'package:vgo_app/Profile/profile_export.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.1 / 2),
          child: SingleChildScrollView(
            child: FutureBuilder(
                future: Get.find<ProfileScreenController>().getUserData(),
                initialData: const <String, dynamic>{},
                builder: (context, snapShot) {
                  var userData = snapShot.data! as Map<String, dynamic>;

                  if (snapShot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Palette.primaryColor,
                      ),
                    );
                  }
                  return Column(
                    children: [
                      // Image Profile and UserName
                      UserImageAndName(
                        size: size,
                        username: userData['username'] as String,
                      ),
                      // User Info
                      UserInfomation(
                        phoneNumber: userData['phoneNumber'],
                        email: userData['email'],
                      ),

                      // User Point Show
                      UserPointShow(
                        size: size,
                        points: userData['points'],
                      ),

                      // All User Button Setting
                      AllUserButtonSetting(size: size),

                      // Log out button
                      const LogOutButton(),
                    ],
                  );
                }),
          ),
        ),
      ),
      /* 
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            () => const EditingProfileScreen(),
            transition: Transition.downToUp,
            duration: const Duration(
              milliseconds: 300,
            ),
          );
        },
        elevation: 0,
        tooltip: 'click to edit you profile',
        backgroundColor: Colors.white,
        child: const Icon(Icons.edit, color: Palette.primaryColor),
      ),
      */
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
