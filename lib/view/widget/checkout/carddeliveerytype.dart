import 'package:flutter/material.dart';
import 'package:k_mandi/core/constant/color.dart';

class CardDeliveryTypeCheckout extends StatelessWidget {
  final String imagename ; 
  final String title  ; 
  final bool active   ; 
  const CardDeliveryTypeCheckout({super.key, required this.imagename, required this.title, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          color:active  ? AppColor.secondColor : null ,
          border: Border.all(color: AppColor.secondColor)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          imagename,
          width: 60,
          color:active ? Colors.white : null ,
        ),
        Text(
          title,
          style: TextStyle(color:active ? Colors.white : AppColor.secondColor, fontWeight:FontWeight.bold ),
        )
      ]),
    );
  }
}