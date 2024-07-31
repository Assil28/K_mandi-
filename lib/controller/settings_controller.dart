import 'package:get/get.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:k_mandi/core/services/services.dart';

abstract class SettingsController extends GetxController{
    logout();
}

class SettingsControllerImp extends SettingsController{

MyServices myServices = Get.find();

  @override
  logout() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.login);
  }

}