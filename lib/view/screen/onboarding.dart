import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/onboarding_controller.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/view/widget/onboarding/custombutton.dart';
import 'package:k_mandi/view/widget/onboarding/customslider.dart';
import 'package:k_mandi/view/widget/onboarding/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    
    return const Scaffold(
      backgroundColor: AppColor.backgroundColor,
        body: SafeArea(
            child: Column(
      children: [
        Expanded(
          flex: 4,
          child: CustomSliderOnBoarding(),
        ),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                 CustomDotControllerOnBoarding(),
                 Spacer(flex: 2,),
                 CustomButtonOnBoarding(),
              ],
            ))
      ],
    )));
  }
}
