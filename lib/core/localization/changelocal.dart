 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/core/services/services.dart';

class LocaleController extends GetxController{

  Locale? language;

  MyServices myServices = Get.find();

  changeLAng(String langcode){
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    Get.updateLocale(locale);
  }

  @override
  void onInit(){
      String? sharedPrefLang = myServices.sharedPreferences.getString("lang");

      if(sharedPrefLang=="ar"){
        language = const Locale("ar");
      }else 
      if(sharedPrefLang=="en"){
        language = const Locale("en");
      }else{
        language = Locale(Get.deviceLocale!.languageCode);
      }
      super.onInit();
  }
 }
