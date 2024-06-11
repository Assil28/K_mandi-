 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/core/constant/routes.dart';

abstract class SuccessSignUpController extends GetxController {
  goToPageLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  late TextEditingController password;
  late TextEditingController repassword;

  @override
  goToPageLogin() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  void onInit() {
     super.onInit();
  }


}
