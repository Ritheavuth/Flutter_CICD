import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vgo_app/Home/Widgets/popular_widget.dart';
import 'package:vgo_app/Home/controller/home_screen_controller.dart';
import 'package:vgo_app/Home/widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          'images/vgo_logo.jpeg',
          width: size.width * 0.3,
          height: 60,
        ),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Promoted Banner
              const PromotedWidget(),
              // Recommded_text
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: TextWidget(
                    text: "Recommendation for you",
                    isBold: true,
                    size: size.width * .04),
              ),
              // Recommend part
              GetX<HomeScreenController>(
                builder: (controller) => RecommededWidget(
                  activties: controller.activities,
                ),
              ),
              // Popular_text
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: TextWidget(
                  text: "Popular and Trending",
                  isBold: true,
                  size: size.width * .04,
                ),
              ),
              // Popular Banner
              GetX<HomeScreenController>(
                builder: (controller) =>
                    PopularWidget(popularAcivities: controller.activities),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
