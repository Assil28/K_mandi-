import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:k_mandi/controller/auth/signup_controller.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/view/widget/auth/custombuttonauth.dart';
import 'package:k_mandi/view/widget/auth/customtextbodyauth.dart';
import 'package:k_mandi/view/widget/auth/customtextformauth.dart';
import 'package:k_mandi/view/widget/auth/customtexttitleauth.dart';
import 'package:k_mandi/view/widget/auth/logoauth.dart';
import 'package:k_mandi/view/widget/auth/textsignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {

    SignUpControllerImpl controller= Get.put(SignUpControllerImpl());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text("Sign Up",
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: AppColor.grey,
                  )),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: ListView(
            children: [
               CustomTextTitleAuth(
                text: "17".tr,
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
                hinttext: "13".tr, labeltext: "12".tr,
                icondata: Icons.person_outlined,
                mycontroller:controller.username
              ),

              CustomTextFormAuth(
                hinttext: "6".tr, labeltext: "4".tr,
                icondata: Icons.email_outlined,
                mycontroller:controller.email
              ),

              CustomTextFormAuth(
                hinttext: "15".tr, labeltext: "14".tr,
                icondata: Icons.phone_outlined,
                mycontroller:controller.phone
              ),
              CustomTextFormAuth(
                hinttext: "7".tr, labeltext: "5".tr,
                icondata: Icons.lock_outlined,
                mycontroller:controller.password
              ),
              // Text(
              //   "8".tr,
              //   textAlign: TextAlign.end,
              // ),
              CustomButtonAuth(text: "11".tr, onPressed: () {}),
              const SizedBox(
                height: 30,
              ),
             
                CustomTextSignUpOrSignIn(
                  textone: "16".tr,
                  texttwo: "9".tr,
                  onTap: () {
                    controller.goToSignIn();
                  })
            ],
          ),
        ));
  }
}
