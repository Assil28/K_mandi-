 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/core/constant/routes.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController repassword;

  @override
    resetPassword() {}

  @override
  goToSuccessResetPassword() {
    Get.offNamed(AppRoutes.successResetPassword);
  }

  @override
  void onInit() {
    //na3mlelhom initialisation
    password = TextEditingController();
    repassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
