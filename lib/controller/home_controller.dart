import 'package:get/get.dart';
import 'package:k_mandi/core/services/services.dart';

abstract class HomeController extends GetxController {}

class HomeControllerImp extends HomeController {
  //3malna appel l service mte3na bech najem nesta3mel sharedpreference l hatitha fih
  MyServices myServices = Get.find();
  String? username;

  initialData() {
    username = myServices.sharedPreferences.getString("username");
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
