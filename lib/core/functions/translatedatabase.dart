import 'package:get/get.dart';
import 'package:k_mandi/core/services/services.dart';

TranslateDataBase(columnar, columnen) {
  MyServices myServices = Get.find();

  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return columnar;
  } else {
    return columnen;
  }
}
