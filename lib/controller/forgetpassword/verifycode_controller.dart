import 'package:get/get.dart';
import 'package:k_mandi/core/class/statusrequest.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:k_mandi/core/functions/handlingdatacontroller.dart';
import 'package:k_mandi/data/datasource/remote/forgetpassword/verifycode.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPaswword(String verifycode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
      VerifyCodeForgetPasswordData(Get.find());

  String? email;

  StatusRequest? statusRequest;

  @override
  checkCode() {}

  @override
  goToResetPaswword(String verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifyCodeForgetPasswordData.postdata(email!, verifycode);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == " success") {
        // se deriger vers resetPassword page
        Get.offNamed(AppRoutes.resetPassword,arguments: {
          "email":email 
        });
      } else {
        Get.defaultDialog(title: "53".tr, middleText: "55".tr);
        statusRequest = StatusRequest.failure;
      }
    }
    // pour faire refresh lel ui
    update();
  }

  @override
  void onInit() {
    //na3mlelhom initialisation
    // hedheya getito mel page check email , 3aditou f route (argument)
    email = Get.arguments['email'];

    super.onInit();
  }
}
