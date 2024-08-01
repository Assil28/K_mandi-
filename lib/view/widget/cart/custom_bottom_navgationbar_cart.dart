import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/view/widget/cart/buttoncart.dart';

class BottomNavgationBarCart extends StatelessWidget {
  final String price ; 
  final String shipping ; 
  final String totalprice ; 
  const BottomNavgationBarCart({super.key, required this.price, required this.shipping, required this.totalprice});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("69".tr, style: const TextStyle(fontSize: 16))),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("$price \$", style: const TextStyle(fontSize: 16)))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding:const  EdgeInsets.symmetric(horizontal: 20),
                child: Text("75".tr, style: const TextStyle(fontSize: 16))),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:  Text("$shipping \$", style: TextStyle(fontSize: 16)))
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("70".tr,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor))),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("$totalprice \$",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor)))
          ],
        ),
       const SizedBox(height: 10),
        CustomButtonCart(
          textbutton: "71".tr,
          onPressed: () {},
        )
      ],
    ));
  }
}