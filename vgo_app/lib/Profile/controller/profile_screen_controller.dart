// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileScreenController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  GetStorage data = GetStorage();

  Future<dynamic> getUserData() async {
    var data = GetStorage().read('VGO_USER');
    String currUserEmail = data['email'];

    dynamic userData = {'': ''};
    await FirebaseFirestore.instance
        .collection('user')
        .where('email', isEqualTo: currUserEmail)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        userData = doc.data();
      });
    });
    return Future.value(userData);
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
      await data.remove('VGO_USER');
    } catch (error) {
      print('could not sign out $error');
    }
  }
}
