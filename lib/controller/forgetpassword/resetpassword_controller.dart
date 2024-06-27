import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/core/class/statusrequest.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:k_mandi/core/functions/handlingdatacontroller.dart';
import 'package:k_mandi/data/datasource/remote/forgetpassword/resetpassword.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  StatusRequest? statusRequest;

  late TextEditingController password;
  late TextEditingController repassword;

  String? email;

  @override
  resetPassword() async {
    var formdata = formstate.currentState;

    if (password.text != repassword.text) {
      return Get.defaultDialog(title: "53".tr, middleText: "58".tr);
    }

    if (formdata!.validate()) {
      print("valid");

      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postdata(email!, password.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == " success") {
          // se deriger vers successResetPassword page
          Get.offNamed(AppRoutes.successResetPassword);

          //ken jit ne5dem flutter 3adi lezemni nzid G et.delet<LoginControllerImpl>(); bch yna7iha mel memoire k nemchi l route e5or
          // medem ne5dem bel GetX w fl main 3malet getPages f 3oudh l route directement w sta3melet list f 3oudh l map
        } else {
          Get.defaultDialog(title: "53".tr, middleText: "59".tr);
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
  goToSuccessResetPassword() {
    Get.offNamed(AppRoutes.successResetPassword);
  }

  @override
  void onInit() {
    //na3mlelhom initialisation
    password = TextEditingController();
    repassword = TextEditingController();

    // bch ngeti l email m route
    email = Get.arguments['email'];

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
