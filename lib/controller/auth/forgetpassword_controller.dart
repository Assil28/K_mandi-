import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/core/constant/routes.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
  goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {

    GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;

  @override
  checkEmail() {
     var formdata = formstate.currentState;
    if(formdata!.validate()){
        print("valid");
    }else{
      print("not valid");
    }
  }

  @override
  goToVerifyCode() {
    Get.offNamed(AppRoutes.verifyCode);
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
