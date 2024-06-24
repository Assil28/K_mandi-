import 'package:get/get.dart';
import 'package:k_mandi/core/class/statusrequest.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:k_mandi/core/functions/handlingdatacontroller.dart';
import 'package:k_mandi/data/datasource/remote/auth/verifycodesignup.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());

  late String verifyCode;

  String? email;

  StatusRequest? statusRequest;

  @override
  checkCode() {}

  @override
  goToSuccessSignUp() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignUpData.postdata(email!, verifyCode!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == " success") {
        // se deriger vers successSignUp
        Get.offNamed(AppRoutes.successSignUp);
      } else {
        Get.defaultDialog(title: "53".tr, middleText: "54".tr);
        statusRequest = StatusRequest.failure;
      }
    }
    // pour faire refresh lel ui
    update();
 
  }

  @override
  void onInit() {
    //na3mlelhom initialisation
    email = Get.arguments['email'];
    super.onInit();
  }
}
