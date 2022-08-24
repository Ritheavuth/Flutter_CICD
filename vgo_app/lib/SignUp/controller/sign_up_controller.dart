// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vgo_app/utility/models/user_model.dart';

class SignUPController extends GetxController {
  GetStorage data = GetStorage();
  String localIdStorage = 'VGO_USER';

  // userPrefer model
  final Map<String, dynamic> _userPref = {
    'isInit': false,
    'email': '',
  }.obs;

  // Create New User
  Future<void> createNewUser(UserModel user) async {
    try {
      // add user to authentication
      await data.remove(localIdStorage);

      _updateUserPref(
        user.email,
      );

      // save userData to localStorage
      data.write(
        localIdStorage,
        {
          'inInit': _userPref['isInit'],
          'email': _userPref['email'],
        },
      );

      print(data.read(localIdStorage));
      // add user model to firebase firestore
      await FirebaseFirestore.instance.collection('user').add({
        'username': '${user.firstName} ${user.lastName}',
        'email': user.email,
        'password': user.password,
        'phoneNumber': user.phoneNumber,
        'points': user.points,
        'createdAt': Timestamp.now(),
      });
      // ignore: duplicate_ignore
    } catch (error) {
      rethrow;
    }
  }

  // User Sign Up
  Future<void> signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        throw 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        throw 'The account already exists for that email.';
      }
    } catch (e) {
      rethrow;
    }
  }

  // Update UserPrefernce
  _updateUserPref(String email) {
    _userPref['email'] = email;
    _userPref['isInit'] = true;

    update();
  }

  // Navigate to other screen
  void goto(Widget screen) {
    Get.to(
      () => screen,
      duration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn,
    );
  }
}
