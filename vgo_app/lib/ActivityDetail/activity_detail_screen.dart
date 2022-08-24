import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:vgo_app/ActivityDetail/widget.dart';

class ActivityDetailScreen extends StatefulWidget {
  final dynamic activity;
  const ActivityDetailScreen({Key? key, required this.activity})
      : super(key: key);

  @override
  State<ActivityDetailScreen> createState() => _ActivityDetailScreenState();
}

class _ActivityDetailScreenState extends State<ActivityDetailScreen> {
  var isTapped = false;

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: isTapped
                  ? null
                  : IconButton(
                      onPressed: () async {
                        Get.back();
                        setState(() {
                          isTapped = true;
                        });
                        await Future.delayed(const Duration(seconds: 1));
                        setState(() {
                          isTapped = false;
                        });
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: isTapped ? Colors.red : Colors.white,
                      ),
                    ),
            ),
            pinned: true,
            expandedHeight: size.height * 0.3,
            backgroundColor: Palette.primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                width: size.width,
                height: size.height * 0.35,
                color: Colors.green,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Image.asset(
                        widget.activity['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Positioned(
                    //   bottom: 20,
                    //   left: 20,
                    //   child: Row(
                    //     children: List.generate(3, (index) {
                    //       return AnimatedContainer(
                    //         duration: const Duration(milliseconds: 500),
                    //         height: index == 0 ? 3 : 1,
                    //         width: index == 0 ? 20 : 10,
                    //         margin: const EdgeInsets.only(right: 2),
                    //         decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           borderRadius: BorderRadius.circular(10),
                    //         ),
                    //       );
                    //     }),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Get Point
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FittedBox(
                        child: TextWidget(
                            text: widget.activity['title'], size: 28),
                      ),
                      Button(
                        title: "Get Point",
                        backgroundColor: Palette.primaryColor,
                        foregroundColor: Colors.white,
                        onTap: () {
                          _showGettingPointForm(context);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  // Star Rating
                  SizedBox(
                    width: size.width * 0.5,
                    child: StarRating(rating: widget.activity['rating']),
                  ),
                  const SizedBox(height: 20),

                  // Description
                  TextWidget(
                    text: widget.activity['description'],
                    size: 14,
                  ),

                  const SizedBox(height: 20),
                  // Video Showcase
                  const SizedBox(child: VideoPlayer()),

                  const SizedBox(height: 20),
                  // Prices
                  const TextWidget(
                    text: "Price(s)",
                    size: 20,
                  ),
                  // Price Show
                  Container(
                    width: size.width,
                    height: widget.activity['priceDetails'].length * 60.0,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                          widget.activity['priceDetails'].length, (index) {
                        var priceTag = widget.activity['priceDetails'];

                        return PriceRow(
                          priceText: '${priceTag[index]}',
                          pricePoint: 10,
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => const ActivityMapScreen(),
                transition: Transition.fadeIn,
                duration: const Duration(microseconds: 400));
          },
          child: Container(
            height: 60,
            width: size.width,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/location_map_icon.svg',
                  color: Colors.white,
                  width: 36,
                  height: 36,
                ),
                const SizedBox(width: 10),
                const TextWidget(
                  text: 'Open Map',
                  size: 26,
                  color: Colors.white,
                  isBold: true,
                ),
              ],
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Palette.primaryColor,
          ),
        ),
      ),
    );
  }

  _showGettingPointForm(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return const PointGetForm();
      },
    );
  }
}
