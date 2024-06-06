import 'package:flutter/material.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:k_mandi/view/screen/auth/login.dart';

Map<String, Widget Function(BuildContext)> routes =  {
  AppRoutes.login: (context)=>const Login()
};