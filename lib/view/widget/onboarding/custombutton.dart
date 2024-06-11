import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/onboarding_controller.dart';
import 'package:k_mandi/core/constant/color.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                  margin: const EdgeInsets.only(bottom: 60),
                  height: 40,
                  child: MaterialButton(
                    padding:const  EdgeInsets.symmetric(horizontal: 100, vertical: 0),
                    onPressed: () {
                      controller.next();
                    },
                    textColor: Colors.white,
                    color: AppColor.primaryColor,
                    child:  Text(
                      "42".tr,
                    ),
                  ),
                );
  }
}