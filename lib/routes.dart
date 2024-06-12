import 'package:flutter/material.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:k_mandi/view/screen/auth/forgetpassword/fogetpassword.dart';
import 'package:k_mandi/view/screen/auth/login.dart';
import 'package:k_mandi/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:k_mandi/view/screen/auth/signup.dart';
import 'package:k_mandi/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:k_mandi/view/screen/auth/success_signup.dart';
import 'package:k_mandi/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:k_mandi/view/screen/auth/verifycodesignup.dart';

import 'package:k_mandi/view/screen/onboarding.dart';

Map<String, Widget Function(BuildContext)> routes = {
  //Auth
  AppRoutes.login: (context) => const Login(),
  AppRoutes.signUp: (context) => const SignUp(),
  AppRoutes.forgetPassword: (context) => const ForgetPassword(),
  AppRoutes.verifyCode: (context) => const VerifyCode(),
  AppRoutes.verifyCodeSignUp: (context) => const VerifyCodeSignUp(),
  AppRoutes.resetPassword: (context) => const ResetPassword(),

  AppRoutes.successSignUp: (context) => const SuccessSignUp(),
  AppRoutes.successResetPassword: (context) => const SuccessResetPassword(),

  //OnBoarding
  AppRoutes.onBoarding: (context) => const OnBoarding(),
};
