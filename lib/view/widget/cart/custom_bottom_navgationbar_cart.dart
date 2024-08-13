import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/cart_controller.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/view/widget/cart/buttoncart.dart';
import 'package:k_mandi/view/widget/cart/custombottomcoupon.dart';

class BottomNavgationBarCart extends GetView<CartControllerImp> {
  final String price;
  final String discount;
  final String shipping;
  final String totalprice;
  final TextEditingController controllercoupon;
  final void Function()? onApplyCoupon;

  const BottomNavgationBarCart(
      {super.key,
      required this.price,
      required this.discount,
      required this.shipping,
      required this.totalprice,
      required this.controllercoupon,
      this.onApplyCoupon});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Pour le Coupon

            GetBuilder<CartControllerImp>(
              builder: (controller) => controller.couponName == null
                  ? Container(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              controller: controllercoupon,
                              decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 10),
                                  hintText: "83".tr,
                                  border: const OutlineInputBorder()),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              flex: 1,
                              child: CustomButtonCoupon(
                                textbutton: "82".tr,
                                onPressed: onApplyCoupon,
                              ))
                        ],
                      ),
                    )
                  : Container(
                      child: Text(
                        "${"83".tr}${controller.couponName!}",
                        style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
            ),

/********************************** */
            Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.primaryColor, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text("69".tr,
                                style: const TextStyle(fontSize: 16))),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text("$price \$",
                                style: const TextStyle(fontSize: 16)))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text("75".tr,
                                style: const TextStyle(fontSize: 16))),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text("$discount ",
                                style: const TextStyle(fontSize: 16)))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text("75".tr,
                                style: const TextStyle(fontSize: 16))),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text("$shipping \$",
                                style: const TextStyle(fontSize: 16)))
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
                  ],
                )),
            const SizedBox(height: 10),
            CustomButtonCart(
              textbutton: "71".tr,
              onPressed: () {
                controller.goToPageCheckout();
              },
            )
          ],
        ));
  }
}
