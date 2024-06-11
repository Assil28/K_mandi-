import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/auth/login_controller.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/core/functions/validinput.dart';
import 'package:k_mandi/view/widget/auth/custombuttonauth.dart';
import 'package:k_mandi/view/widget/auth/customtextbodyauth.dart';
import 'package:k_mandi/view/widget/auth/customtextformauth.dart';
import 'package:k_mandi/view/widget/auth/customtexttitleauth.dart';
import 'package:k_mandi/view/widget/auth/logoauth.dart';
import 'package:k_mandi/view/widget/auth/textsignup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text("9".tr,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: AppColor.grey,
                  )),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            key:  controller.formstate,
            child: ListView(
              children: [
                const LogoAuth(),
                CustomTextTitleAuth(
                  text: "2".tr,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextBodyAuth(
                  text: "3".tr,
                ),
                const SizedBox(
                  height: 45,
                ),
                CustomTextFormAuth(
                  valid: (val) {
                    return validInput(val!, 5, 100, "email");
                  },
                  hinttext: "6".tr,
                  labeltext: "4".tr,
                  icondata: Icons.email_outlined,
                  mycontroller: controller.email,
                ),
                CustomTextFormAuth(
                    valid: (val) {
                      return validInput(val!, 5, 30, "password");
                    },
                    hinttext: "7".tr,
                    labeltext: "5".tr,
                    icondata: Icons.lock_outlined,
                    mycontroller: controller.password),
                InkWell(
                  onTap: () {
                    controller.goToForgetPassword();
                  },
                  child: Text(
                    "8".tr,
                    textAlign: TextAlign.end,
                  ),
                ),
                CustomButtonAuth(text: "9".tr, onPressed: () {
                  controller.login();
                }),
                const SizedBox(
                  height: 30,
                ),
                CustomTextSignUpOrSignIn(
                    textone: "10".tr,
                    texttwo: "11".tr,
                    onTap: () {
                      controller.goToSignUp();
                    })
              ],
            ),
          ),
        ));
  }
}
