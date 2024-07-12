import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:k_mandi/core/middleware/mymiddleware.dart';
import 'package:k_mandi/view/screen/auth/forgetpassword/fogetpassword.dart';
import 'package:k_mandi/view/screen/homescreen.dart';
import 'package:k_mandi/view/screen/auth/login.dart';
import 'package:k_mandi/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:k_mandi/view/screen/auth/signup.dart';
import 'package:k_mandi/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:k_mandi/view/screen/auth/success_signup.dart';
import 'package:k_mandi/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:k_mandi/view/screen/auth/verifycodesignup.dart';
import 'package:k_mandi/view/screen/home.dart';
import 'package:k_mandi/view/screen/language.dart';

import 'package:k_mandi/view/screen/onboarding.dart';

// medem nesta3mel fel getx donc  bch na3mel List
List<GetPage<dynamic>>? routes = [
  // l app par defaut tabda m Language nhot fiha l middleware l 3malto
  // GetPage(
  //     name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
   GetPage(
      name: "/", page: () => const HomeScreen(),),

//Auth
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.signUp, page: () => const SignUp()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCode()),
  GetPage(
      name: AppRoutes.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoutes.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoutes.successResetPassword,
      page: () => const SuccessResetPassword()),

  //OnBoarding
  GetPage(name: AppRoutes.onBoarding, page: () => const OnBoarding()),

  // Home
  GetPage(name: AppRoutes.homePage, page: () => const HomeScreen()),
];










// nesta3mel l map k ne5dem 3adi mch bel getx
// Map<String, Widget Function(BuildContext)> routes = {
//   //Auth
//   AppRoutes.login: (context) => const Login(),
//   AppRoutes.signUp: (context) => const SignUp(),
//   AppRoutes.forgetPassword: (context) => const ForgetPassword(),
//   AppRoutes.verifyCode: (context) => const VerifyCode(),
//   AppRoutes.verifyCodeSignUp: (context) => const VerifyCodeSignUp(),
//   AppRoutes.resetPassword: (context) => const ResetPassword(),

//   AppRoutes.successSignUp: (context) => const SuccessSignUp(),
//   AppRoutes.successResetPassword: (context) => const SuccessResetPassword(),

//   //OnBoarding
//   AppRoutes.onBoarding: (context) => const OnBoarding(),
// };
