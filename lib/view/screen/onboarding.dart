import 'package:flutter/material.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/data/datasource/static/static.dart';
import 'package:k_mandi/view/widget/onboarding/custombutton.dart';
import 'package:k_mandi/view/widget/onboarding/customslider.dart';
import 'package:k_mandi/view/widget/onboarding/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Expanded(
          flex: 3,
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
