import 'package:flutter/material.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:k_mandi/view/screen/auth/login.dart';
import 'package:k_mandi/view/screen/onboarding.dart';

Map<String, Widget Function(BuildContext)> routes =  {
  AppRoutes.login: (context)=>const Login(),
    AppRoutes.onBoarding: (context)=>const OnBoarding(),

};