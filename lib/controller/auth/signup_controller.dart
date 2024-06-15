import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/core/constant/routes.dart';

abstract class SignUpController extends GetxController {
  signup();
  goToSignIn();
}

class SignUpControllerImpl extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
 
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

    bool isShowPassword = true;

    showPassword(){
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  signup() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("valid");
      Get.offNamed(AppRoutes.verifyCodeSignUp);
    } else {
      print("not valid");
    }
  }



  @override
  goToSignIn() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();

    super.dispose();
  }
}
