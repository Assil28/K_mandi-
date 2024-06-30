import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:k_mandi/core/services/services.dart';

class MyMiddleWare extends GetMiddleware {
  int? get priority => 1;
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {

    //lehna bch ntasti idha lguit l user login  donc direct n3adih lel page home
    if (myServices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: AppRoutes.homePage);
    }

    //lehna bch ntasti idha lguit l user 3mal l choose language lmara loula wale ken 3mal bch yheznii direct lel login
    if (myServices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: AppRoutes.login);
    } else {
      return const RouteSettings(name: AppRoutes.onBoarding);
    }
  }
}
