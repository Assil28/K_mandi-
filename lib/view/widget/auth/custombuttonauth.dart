import 'package:flutter/material.dart';
import 'package:k_mandi/core/constant/color.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtonAuth(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed,
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text(
          text,
        ),
      ),
    );
  }
}
