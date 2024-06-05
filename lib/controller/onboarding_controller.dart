import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();

  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;

  late PageController pageController;

  @override
  next() {
    currentPage++;
    pageController.animateToPage(currentPage, duration: const Duration(microseconds: 900), curve: Curves.easeInOut);
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
