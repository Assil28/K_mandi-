import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:k_mandi/view/address/add.dart';
import 'package:k_mandi/view/address/addaddressdetails.dart';
import 'package:k_mandi/view/address/view.dart';
import 'package:k_mandi/view/screen/auth/forgetpassword/fogetpassword.dart';
import 'package:k_mandi/view/screen/cart.dart';
import 'package:k_mandi/view/screen/checkout.dart';
import 'package:k_mandi/view/screen/homescreen.dart';
import 'package:k_mandi/view/screen/auth/login.dart';
import 'package:k_mandi/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:k_mandi/view/screen/auth/signup.dart';
import 'package:k_mandi/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:k_mandi/view/screen/auth/success_signup.dart';
import 'package:k_mandi/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:k_mandi/view/screen/auth/verifycodesignup.dart';
import 'package:k_mandi/view/screen/home.dart';
import 'package:k_mandi/view/screen/items.dart';
import 'package:k_mandi/view/screen/myfavorite.dart';

import 'package:k_mandi/view/screen/onboarding.dart';
import 'package:k_mandi/view/screen/orders/pending.dart';
import 'package:k_mandi/view/screen/productdetails.dart';

// medem nesta3mel fel getx donc  bch na3mel List
List<GetPage<dynamic>>? routes = [
  // l app par defaut tabda m Language nhot fiha l middleware l 3malto
  // GetPage(
  //     name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
   GetPage(
      name: "/", page: () => const HomePage(),),

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


  // Items page
  GetPage(name: AppRoutes.items, page: () => const Items()),
  GetPage(name: AppRoutes.productdetails, page: () => const ProductDetails()),

  // Favorite
  GetPage(name: AppRoutes.myfavorite, page: () => const MyFavorite()),


  //Cart
   GetPage(name: AppRoutes.cart, page: () => const Cart()),

   //Adress client
   GetPage(name: AppRoutes.addressview, page: () => const AddressView()),
   GetPage(name: AppRoutes.addressadd, page: () => const AddressAdd()),
   GetPage(name: AppRoutes.addressadddetails, page: () => const AddressAddDetails()),

   //CheckOut
      GetPage(name: AppRoutes.checkout, page: () => const Checkout()),

      //Orders
      GetPage(name: AppRoutes.orderspending, page: () => const OrdersPending()),
 
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
