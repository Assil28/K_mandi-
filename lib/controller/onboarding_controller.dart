import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:k_mandi/core/services/services.dart';
import 'package:k_mandi/data/datasource/static/static.dart';

abstract class OnBoardingController extends GetxController {
  next();

  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;

  MyServices myServices = Get.find();

  late PageController pageController;

  @override
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      //lehna gotlo medem l user awel mara ysob lapp w mzl me 3malech choose language donc hotli f sharedpreference l onboarding a 1
      myServices.sharedPreferences.setString("onboarding", "1");
      ////////
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(microseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update(); //bch yaamel mise a jour lel ui
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
