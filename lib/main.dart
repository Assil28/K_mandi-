import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/core/localization/changelocal.dart';
import 'package:k_mandi/core/localization/translation.dart';
import 'package:k_mandi/core/services/services.dart';
import 'package:k_mandi/routes.dart';
import 'package:k_mandi/test.dart';
import 'package:k_mandi/view/screen/auth/login.dart';
import 'package:k_mandi/view/screen/language.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "PlayfairDisplay",
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: AppColor.balck),
               headline2: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.balck),
          bodyText1: TextStyle(
            height: 2,
            color: AppColor.grey,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
           bodyText2: TextStyle(
            height: 2,
            color: AppColor.grey,
            fontSize: 14,
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
     // home: const Test(),
      routes: routes,
    );
  }
}
