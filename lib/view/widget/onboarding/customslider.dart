import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/onboarding_controller.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                Image.asset(
                  onBoardingList[i].image!,
                  // width: 300,
                  height:
                      Get.width / 1.3, //3oredh lecran howa nafso toul taswira
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  onBoardingList[i].title!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: AppColor.balck),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    onBoardingList[i].body!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      height: 2,
                      color: AppColor.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ));
  }
}
