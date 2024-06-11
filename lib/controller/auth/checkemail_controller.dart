import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/core/constant/routes.dart';

abstract class CheckEmailController extends GetxController {
  checkEmail();
  goToSuccessSignUp();
}

class CheckEmailControllerImp extends CheckEmailController {
  late TextEditingController email;

  @override
  checkEmail() {}

  @override
  goToSuccessSignUp() {
    Get.offNamed(AppRoutes.successSignUp );
  }

  @override
  void onInit() {
    //na3mlelhom initialisation
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
