// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ActivityDiscountController extends GetxController {
  final _activityDiscount = [].obs;

  List get activityDiscount {
    return [..._activityDiscount].reversed.toList();
  }

  Future<void> getDataFromJson() async {
    final String response =
        await rootBundle.loadString('assets/data/discount.json');
    List dataList = await json.decode(response) as List<dynamic>;

    _activityDiscount.clear();

    dataList.forEach((value) {
      _activityDiscount.add(value);
    });
    update();
  }
}
