import 'package:get/get.dart';
import 'package:k_mandi/core/constant/routes.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
      late String verifyCode;
  @override
  checkCode() {}

  @override
  goToSuccessSignUp() {
    Get.offNamed(AppRoutes.successSignUp );
  }

  @override
  void onInit() {
    //na3mlelhom initialisation
    super.onInit();
  }


}
