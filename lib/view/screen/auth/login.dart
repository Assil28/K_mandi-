import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/view/widget/auth/custombuttonauth.dart';
import 'package:k_mandi/view/widget/auth/customtextbodyauth.dart';
import 'package:k_mandi/view/widget/auth/customtextformauth.dart';
import 'package:k_mandi/view/widget/auth/customtexttitleauth.dart';
import 'package:k_mandi/view/widget/auth/logoauth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text("Sign In",
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: AppColor.grey,
                  )),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
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
                hinttext: "6".tr, labeltext: "4".tr,
                icondata: Icons.email_outlined,
                //mycontroller:
              ),
              CustomTextFormAuth(
                hinttext: "7".tr, labeltext: "5".tr,
                icondata: Icons.lock_outlined,
                //mycontroller:
              ),
              Text(
                "8".tr,
                textAlign: TextAlign.end,
              ),
              CustomButtonAuth(text: "9".tr, onPressed: () {}),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("10".tr),
                  InkWell(
                    child: Text(
                      "11".tr,
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
