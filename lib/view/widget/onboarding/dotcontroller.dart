import 'package:flutter/material.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/data/datasource/static/static.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                        onBoardingList.length,
                        (index) => AnimatedContainer(
                              margin: const EdgeInsets.only(right: 5),
                              duration: const Duration(
                                milliseconds: 900,
                              ),
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ))
                  ],
                );
  }
}