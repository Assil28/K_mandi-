import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:k_mandi/core/services/services.dart';

abstract class SettingsController extends GetxController {
  logout();
}

class SettingsControllerImp extends SettingsController {
  MyServices myServices = Get.find();

  @override
  logout() {
    // insubscribe m topic
    String userid = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.subscribeToTopic("users");
    FirebaseMessaging.instance.subscribeToTopic("users$userid");

    // vider shared préférence
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.login);
  }
}
