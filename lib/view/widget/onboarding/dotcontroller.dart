import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/onboarding_controller.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/data/datasource/static/static.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (contoller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 5),
                          duration: const Duration(
                            milliseconds: 900,
                          ),
                          width: contoller.currentPage == index ? 20 : 5,
                          height: 6,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ))
              ],
            ));
  }
}
