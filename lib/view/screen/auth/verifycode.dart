import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/auth/forgetpassword_controller.dart';
import 'package:k_mandi/controller/auth/verifycode_controller.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/view/widget/auth/custombuttonauth.dart';
import 'package:k_mandi/view/widget/auth/customtextbodyauth.dart';
import 'package:k_mandi/view/widget/auth/customtextformauth.dart';
import 'package:k_mandi/view/widget/auth/customtexttitleauth.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller =
        Get.put(VerifyCodeControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text("21".tr,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: AppColor.grey,
                  )),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: ListView(
            children: [
              CustomTextTitleAuth(
                text: "20".tr,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextBodyAuth(
                text: "23".tr,
              ),
              const SizedBox(
                height: 45,
              ),
              OtpTextField(
                fieldWidth: 50.0,
                borderRadius: BorderRadius.circular(20),
                numberOfFields: 5,
                borderColor: const  Color(0xFF512DA8),
//set to true to show as box or false to show as dash
                showFieldAsBox: true,
//runs when a code is typed in
                onCodeChanged: (String code) {},
//handle validation or checks here
//runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  controller.goToResetPaswword();
                },
              ),
              
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ));
  }
}
