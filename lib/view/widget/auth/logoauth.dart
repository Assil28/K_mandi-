import 'package:flutter/material.dart';
import 'package:k_mandi/core/constant/imageassets.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImageAsset.logo,height: 170,);
  }
}