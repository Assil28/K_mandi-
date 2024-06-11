import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:k_mandi/controller/auth/forgetpassword_controller.dart';
import 'package:k_mandi/controller/auth/signup_controller.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/view/widget/auth/custombuttonauth.dart';
import 'package:k_mandi/view/widget/auth/customtextbodyauth.dart';
import 'package:k_mandi/view/widget/auth/customtextformauth.dart';
import 'package:k_mandi/view/widget/auth/customtexttitleauth.dart';
import 'package:k_mandi/view/widget/auth/logoauth.dart';
import 'package:k_mandi/view/widget/auth/textsignup.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {

    ForgetPasswordControllerImp controller= Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text("8".tr,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: AppColor.grey,
                  )),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: ListView(
            children: [
               CustomTextTitleAuth(
                text: "18".tr,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextBodyAuth(
                text: "22".tr,
              ),
              const SizedBox(
                height: 15,
              ),
              

              CustomTextFormAuth(
                hinttext: "6".tr, labeltext: "4".tr,
                icondata: Icons.email_outlined,
                mycontroller:controller.email
              ),

            
              CustomButtonAuth(text: "19".tr, onPressed: () {
                controller.goToVerifyCode();
              }),
              const SizedBox(
                height: 30,
              ),
             
              
            ],
          ),
        ));
  }
}