import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/core/constant/routes.dart';

abstract class CheckEmailController extends GetxController {
  checkEmail();
  goToVerifyCodeSignUp();
}

class CheckEmailControllerImp extends CheckEmailController {
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
  goToVerifyCodeSignUp() {
    Get.offNamed(AppRoutes.verifyCodeSignUp );
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
