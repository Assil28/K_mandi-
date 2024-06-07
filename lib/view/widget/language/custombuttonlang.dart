import 'package:flutter/material.dart';
import 'package:k_mandi/core/constant/color.dart';

class CustomButtonLang extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonLang({super.key,required this.textbutton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              width: double.infinity,
              child: MaterialButton(
                color: AppColor.primaryColor,
                onPressed: onPressed,
                textColor: Colors.white,
                child: Text(textbutton,style: TextStyle(fontWeight: FontWeight.bold),),
              ),
            );
  }
}