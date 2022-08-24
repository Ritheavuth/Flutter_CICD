import 'package:flutter/material.dart';
import 'package:vgo_app/Home/Widgets/popular_item_widget.dart';

class PopularWidget extends StatelessWidget {
  final List popularAcivities;
  const PopularWidget({
    Key? key,
    required this.popularAcivities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: List.generate(popularAcivities.length, (index) {
          return PopularItemWidget(popularActivity: popularAcivities[index]);
        }),
      ),
    );
  }
}
