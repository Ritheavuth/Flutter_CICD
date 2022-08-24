import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreenController extends GetxController {
  SplashScreenController();
  final _isNeedLogin = true.obs;
  final _userEmail = ''.obs;
  GetStorage data = GetStorage();
  dynamic userDataPref;
  get isNeedLogin => _isNeedLogin.value;
  get userEmail => _userEmail;

  Future<void> getUserDataFromLocalStorage() async {
    var userData = await data.read('VGO_USER');

    if (userData != null) {
      userDataPref = userData;
      _isNeedLogin.value = false;
      _userEmail.value = userData['email'];
    }
  }

  removeDataPreference() {
    data.remove('VGO_USER');
  }
}
