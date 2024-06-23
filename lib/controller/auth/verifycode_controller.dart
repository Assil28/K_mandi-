import 'package:get/get.dart';
import 'package:k_mandi/core/constant/routes.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPaswword();
}

class VerifyCodeControllerImp extends VerifyCodeController {
      late String verifyCode;
  @override
  checkCode() {}

  @override
  goToResetPaswword() {
    Get.offNamed(AppRoutes.resetPassword);
  }

  @override
  void onInit() {
    //na3mlelhom initialisation
    super.onInit();
  }


}
