import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/core/class/statusrequest.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:k_mandi/core/functions/handlingdatacontroller.dart';
import 'package:k_mandi/data/datasource/remote/auth/signup.dart';

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

  StatusRequest statusRequest=StatusRequest.none;
  List data = [];
  SignUpData signUpData = SignUpData(Get.find());

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  signup() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("valid");

      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postdata(
          username.text, password.text, email.text, phone.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == " success") {
          // se deriger vers verifycode
          Get.offNamed(AppRoutes.verifyCodeSignUp, arguments: {"email": email.text});
          //ken jit ne5dem flutter 3adi lezemni nzid G et.delet<SignUpControllerImpl>(); bch yna7iha mel memoire k nemchi l route e5or
          // medem ne5dem bel GetX w fl main 3malet getPages f 3oudh l route directement w sta3melet list f 3oudh l map
        } else {
          Get.defaultDialog(title: "53".tr, middleText: "54".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      // pour faire refresh lel ui
      update();
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
