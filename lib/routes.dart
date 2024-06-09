import 'package:flutter/material.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:k_mandi/view/screen/auth/fogetpassword.dart';
import 'package:k_mandi/view/screen/auth/login.dart';
import 'package:k_mandi/view/screen/auth/resetpassword.dart';
import 'package:k_mandi/view/screen/auth/signup.dart';
import 'package:k_mandi/view/screen/auth/verifycode.dart';

import 'package:k_mandi/view/screen/onboarding.dart';

Map<String, Widget Function(BuildContext)> routes = {
  //Auth
  AppRoutes.login: (context) => const Login(),
  AppRoutes.signUp: (context) => const SignUp(),
  AppRoutes.forgetPassword: (context) => const ForgetPassword(),
  AppRoutes.verifyCode: (context) => const VerifyCode(),
  AppRoutes.resetPassword: (context) => const ResetPassword(),

  //OnBoarding
  AppRoutes.onBoarding: (context) => const OnBoarding(),
};
