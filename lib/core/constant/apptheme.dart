import 'package:flutter/material.dart';
import 'package:k_mandi/core/constant/color.dart';

ThemeData  themeEnglish = ThemeData(
        fontFamily: "PlayfairDisplay",
        textTheme:  const TextTheme(
          headlineLarge: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: AppColor.black),
               headlineMedium: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
          bodyLarge: TextStyle(
            height: 2,
            color: AppColor.grey,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
           bodyMedium: TextStyle(
            height: 2,
            color: AppColor.grey,
            fontSize: 14,
          ),
        ),
        primarySwatch: Colors.blue,
      );

      ThemeData  themeArabic = ThemeData(
        fontFamily: "Cairo",
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: AppColor.black),
               headlineMedium: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
          bodyLarge: TextStyle(
            height: 2,
            color: AppColor.grey,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
           bodyMedium: TextStyle(
            height: 2,
            color: AppColor.grey,
            fontSize: 14,
          ),
        ),
        primarySwatch: Colors.blue,
      );