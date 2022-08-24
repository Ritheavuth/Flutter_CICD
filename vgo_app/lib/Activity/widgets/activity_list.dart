import 'package:flutter/material.dart';
import 'package:vgo_app/Activity/widgets/activity_item.dart';

class ActivityList extends StatelessWidget {
  final Size deviceSize;
  final List activties;
  const ActivityList({
    Key? key,
    required this.deviceSize,
    required this.activties,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: deviceSize.width,
      height: deviceSize.height * 0.75,
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 20),
        itemCount: activties.length,
        itemBuilder: (BuildContext context, int index) {
          return ActivityItem(
            deviceSize: deviceSize,
            activity: activties[index],
          );
        },
      ),
    );
  }
}
