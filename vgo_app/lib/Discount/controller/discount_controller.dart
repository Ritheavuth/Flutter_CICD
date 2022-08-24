// ignore_for_file: avoid_function_literals_in_foreach_calls
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DiscountScreenController extends GetxController {
  final users = FirebaseFirestore.instance.collection('user');
  final discounts = FirebaseFirestore.instance.collection('discounts');

  // Get current user point from firebase
  Future<int> getPoint() async {
    var email = await getUserEmail();
    int points = 0;
    await FirebaseFirestore.instance
        .collection('user')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (doc['email'] as String == email) {
          points = doc['points'];
        }
      });
    });
    return Future.value(points);
  }

  // GET: User Minus point from Discounting
  Future<void> getDiscount(int points) async {
    var email = await getUserEmail();
    var currentUserPoint = await getCurrentUserPoint();

    if (currentUserPoint >= points) {
      // update User point
      await users
          .where('email', isEqualTo: email)
          .get()
          .then((QuerySnapshot querySnapshot) => {
                querySnapshot.docs.forEach((doc) {
                  doc.reference.update({
                    'points': currentUserPoint - points,
                  });
                })
              });
    }
  }

  // fetching userpoint from firebase
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

  // PUSH: adding discount gettting to discounts collections;
  Future<void> addDiscountData(
    int discountPoints,
    String acitvityTitle,
    String discountPercentage,
  ) async {
    var email = await getUserEmail();
    try {
      await discounts.add({
        'email': email,
        'discountPoint': discountPoints,
        'activityName': acitvityTitle,
        'discountPercentage': discountPercentage,
        'createdAt': Timestamp.now(),
      });
    } catch (err) {
      rethrow;
    }
  }

  Future<String?> getUserEmail() async {
    var data = GetStorage().read("VGO_USER");
    var email = data['email'];

    return email;
  }

  Stream<QuerySnapshot> get userPoints {
    var data = GetStorage().read("VGO_USER");
    var email = data['email'];
    return users.where('email', isEqualTo: email).snapshots();
  }
}
