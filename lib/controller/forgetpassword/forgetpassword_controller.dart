import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/core/class/statusrequest.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:k_mandi/core/functions/handlingdatacontroller.dart';
import 'package:k_mandi/data/datasource/remote/forgetpassword/checkemail.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {

CheckEmailData checkEmailData = CheckEmailData(Get.find());
    GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;

  StatusRequest? statusRequest;

  @override
  checkEmail()async {
     var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("valid");

      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postdata(email.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == " success") {
          // se deriger vers verifyCode page
          Get.offNamed(AppRoutes.verifyCode,arguments: {
            "email":email.text
          }
              );
          //ken jit ne5dem flutter 3adi lezemni nzid G et.delet<LoginControllerImpl>(); bch yna7iha mel memoire k nemchi l route e5or
          // medem ne5dem bel GetX w fl main 3malet getPages f 3oudh l route directement w sta3melet list f 3oudh l map
        } else {
          Get.defaultDialog(title: "53".tr, middleText: "57".tr);
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
