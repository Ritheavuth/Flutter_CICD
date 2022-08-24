import 'package:get/get.dart';
import 'package:vgo_app/ActivityDetail/controllers/acitvity_detail_controller.dart';
import 'package:vgo_app/Discount/controller/activity_list_discount_controller.dart';
import 'package:vgo_app/Discount/controller/discount_controller.dart';
import 'package:vgo_app/Home/controller/home_screen_controller.dart';
import 'package:vgo_app/Login/controller/login_controller.dart';
import 'package:vgo_app/Profile/controller/profile_screen_controller.dart';
import 'package:vgo_app/SignUp/controller/sign_up_controller.dart';
import 'package:vgo_app/Welcome/controllers/splash_screen_controller.dart';

class AppController extends GetxController {
  startApp() {
    Get.lazyPut(() => SplashScreenController());
    Get.lazyPut(() => SignUPController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => ActivityDetailController());
    Get.lazyPut(() => HomeScreenController());
    Get.lazyPut(() => DiscountScreenController());
    Get.lazyPut(() => ActivityDiscountController());
    Get.lazyPut(() => ProfileScreenController());
  }
}
