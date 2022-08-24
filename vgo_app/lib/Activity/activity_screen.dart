import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vgo_app/Activity/widgets/activity_list.dart';
import 'package:vgo_app/Activity/widgets/category_row.dart';
import 'package:vgo_app/Home/controller/home_screen_controller.dart';
import 'package:vgo_app/utility/text_widget.dart';

class ActiviyScreen extends StatelessWidget {
  const ActiviyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          width: deviceSize.width,
          height: deviceSize.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextWidget(
                    text: 'Activity Lists', size: deviceSize.width * 0.07),
              ),

              // Category List
              const CategoryRow(),

              // Activity List
              GetX<HomeScreenController>(
                builder: (controller) => ActivityList(
                  deviceSize: deviceSize,
                  activties: controller.activities,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
