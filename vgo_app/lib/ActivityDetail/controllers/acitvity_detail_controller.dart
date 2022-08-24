import 'package:get/get.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

class ActivityDetailController extends GetxController {
  final users = FirebaseFirestore.instance.collection('user');

  Future<void> addPoint(int points) async {
    var email = await getUserEmail();
    int currentUserPoint = await getCurrentUserPoint();
    // int currentUserPoint = 0;
    print(email);
    // update User point
    try {
      await users.where('email', isEqualTo: email).get().then((querySnapshot) {
        querySnapshot.docs.forEach((documentSnapshot) {
          documentSnapshot.reference.update({
            'points': points + currentUserPoint,
          });
        });
      });
    } catch (err) {
      print('can\'t add data to account');
    }
  }

  Future<int> getCurrentUserPoint() async {
    var email = await getUserEmail();
    int userPoints = 0;
    var docId = '';

    await users.where('email', isEqualTo: email).get().then((querySnapshot) {
      querySnapshot.docs.forEach((documentSnapshot) {
        docId = documentSnapshot.reference.id.toString();
      });
    });
    await users.doc(docId).get().then((DocumentSnapshot documentSnapshot) {
      var datas = documentSnapshot.data() as Map<String, dynamic>;
      userPoints = datas['points'] as int;
    });

    return userPoints;
  }

  Future<String> getUserEmail() async {
    var data = await GetStorage().read("VGO_USER");
    var email = data['email'];
    return email;
  }
}
