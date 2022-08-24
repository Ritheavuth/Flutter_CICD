// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vgo_app/utility/models/user_model.dart';

class HomeScreenController extends GetxController {
  final List _activties = [].obs;
  final Rx<UserModel> _userData = UserModel(
    firstName: '',
    lastName: '',
    email: '',
    password: '',
  ).obs;

  UserModel get userData => _userData.value;

  get activities {
    return [..._activties];
  }

  Future<void> getDataFromJson() async {
    final String response =
        await rootBundle.loadString('assets/data/activity.json');
    List data = await json.decode(response);
    _activties.clear();
    data.forEach((value) {
      _activties.add(value);
    });

    // print(_activties);
    // print(data);
  }

  Future<void> updateUserData() async {
    var data = GetStorage().read('VGO_USER');
    String currUserEmail = data['email'];
    await FirebaseFirestore.instance
        .collection('user')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (doc['email'] == currUserEmail) {
          var userDatas = doc.data() as Map<String, dynamic>;
          _userData.value.email = userDatas['email'];
          _userData.value.phoneNumber = userDatas['phoneNumber'];
          _userData.value.points = userDatas['points'];
          _userData.value.firstName =
              userDatas['username'].toString().split(' ')[0];
          _userData.value.lastName =
              userDatas['username'].toString().split(' ')[1];
        }
      });
    });
    update();
  }
}
