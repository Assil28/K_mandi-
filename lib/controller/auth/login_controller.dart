import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/core/constant/routes.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
GlobalKey <FormState> formstate = GlobalKey<FormState>(); 

  late TextEditingController email;
  late TextEditingController password;

  @override
  login() {
    var formdata = formstate.currentState;
    if(formdata!.validate()){
        print("valid");
    }else{
      print("not valid");
    }
  }

  @override
   goToSignUp() {
    Get.offNamed(AppRoutes.signUp);
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  void onInit() {
    //na3mlelhom initialisation
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
