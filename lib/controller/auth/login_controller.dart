import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/core/class/statusrequest.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:k_mandi/core/functions/handlingdatacontroller.dart';
import 'package:k_mandi/core/services/services.dart';
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

  //3malna appel l service mte3na bech najem nesta3mel sharedpreference l hatitha fih
  MyServices myServices = Get.find();

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
          // k yabde 3amel compte w 3amelo approuve
          if (response['status']['users_approuve'] == "1") {
            // bch nsavii l user authenntifié f shared preferences
            myServices.sharedPreferences
                .setString("id", response['data']['users_id']);
            myServices.sharedPreferences
                .setString("username", response['data']['users_name']);
            myServices.sharedPreferences
                .setString("email", response['data']['users_email']);
            myServices.sharedPreferences
                .setString("phone", response['data']['users_phone']);
            // lehna bch k yabda l user c deja connecté w 3awed dkhal lel application direct yhezo lel home page ( middleware) kif fazet l onboarding
            myServices.sharedPreferences.setString("step", "2");

            // se deriger vers Home page
            Get.offNamed(
              AppRoutes.homePage,
            );
            //ken jit ne5dem flutter 3adi lezemni nzid G et.delet<LoginControllerImpl>(); bch yna7iha mel memoire k nemchi l route e5or
            // medem ne5dem bel GetX w fl main 3malet getPages f 3oudh l route directement w sta3melet list f 3oudh l map
          }
          else{
            // k yabde 3amel compte w me 3malouch eprouve
             Get.offNamed(
              AppRoutes.verifyCodeSignUp,arguments: {
                "email":email.text
              }
            );
          }
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

    // Bch najem ne5o biha token mel FireBAse
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
    });
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
