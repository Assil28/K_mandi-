import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:k_mandi/core/localization/changelocal.dart';
import 'package:k_mandi/view/widget/language/custombuttonlang.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr, style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(
              height: 20,
            ),
            CustomButtonLang(textbutton: "Ar", onPressed: () {
              controller.changeLAng("ar");
              Get.toNamed(AppRoutes.onBoarding);
            }),
            CustomButtonLang(textbutton: "En", onPressed: () {
              controller.changeLAng("en");
              Get.toNamed(AppRoutes.onBoarding);
            }),
          ],
        ),
      ),
    );
  }
}
