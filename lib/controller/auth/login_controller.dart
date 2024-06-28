import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/core/class/statusrequest.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:k_mandi/core/functions/handlingdatacontroller.dart';
import 'package:k_mandi/data/datasource/remote/auth/login.dart';
import 'package:k_mandi/view/screen/auth/login.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

    LoginData loginData = LoginData(Get.find());


  late TextEditingController email;
  late TextEditingController password;

  bool isShowPassword = true;

  StatusRequest statusRequest = StatusRequest.none;

  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("valid");

      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(email.text, password.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == " success") {
          // se deriger vers Home page
          Get.offNamed(AppRoutes.homePage,
              );
          //ken jit ne5dem flutter 3adi lezemni nzid G et.delet<LoginControllerImpl>(); bch yna7iha mel memoire k nemchi l route e5or
          // medem ne5dem bel GetX w fl main 3malet getPages f 3oudh l route directement w sta3melet list f 3oudh l map
        } else {
          Get.defaultDialog(title: "53".tr, middleText: "56".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      // pour faire refresh lel ui
      update();
    } else {
      print("not valid");
    }
  }

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
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
