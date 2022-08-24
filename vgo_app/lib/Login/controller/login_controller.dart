// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  LoginController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String localStorageId = 'VGO_USER';
  GetStorage data = GetStorage();

  Map<String, String> get userPrefData {
    return data.read(localStorageId);
  }

  // User Login
  Future<void> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      await data.write(
        localStorageId,
        {
          'inInit': true,
          'email': email,
        },
      );
    } on FirebaseAuthException catch (error) {
      if (error.code == 'invalid-email') {
        throw 'email is not correct';
      } else if (error.code == 'wrong-password') {
        throw 'password is not correct';
      } else {
        throw 'Email does not exist';
      }
    } catch (error) {
      throw 'Something was Wrong';
    }
    print(data.read('VGO_USER'));
  }

  void goto(Widget screen) {
    Get.to(
      () => screen,
      duration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn,
    );
  }
}
