import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:k_mandi/core/constant/apptheme.dart';
import 'package:k_mandi/core/services/services.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();
  ThemeData appTheme = themeEnglish;

  changeLAng(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

//demander la permission pour la localisation
  requestPermissionLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    // hne gotlo ken localisation mch actif raj3o actif
    if (!serviceEnabled) {
      return Get.snackbar("49".tr, "77".tr);
    }

    //hne bch nchouf est ce que lapplication 3andha permission lel localisation wale
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("49".tr, "78".tr);
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar("49".tr, "79".tr);
    }
  }

  @override
  void onInit() async{
     await requestPermissionLocation();
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");

    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
