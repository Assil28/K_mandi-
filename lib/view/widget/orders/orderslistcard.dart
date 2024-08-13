import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/orders/pending_controller.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:k_mandi/data/datasource/model/ordersmodel.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersList extends GetView<OrdersPendingController> {
  final OrdersModel listdata;
  const CardOrdersList({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("${'105'.tr} #${listdata.ordersId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  // Text(listdata.ordersDatetime!)
                  // Text(
                  //   Jiffy(listdata.ordersDatetime!, "yyyy-MM-dd").fromNow(),
                  //   style: const TextStyle(
                  //       color: AppColor.primaryColor,
                  //       fontWeight: FontWeight.bold),
                  // )
                ],
              ),
              const Divider(),
              Text(
                "${'98'.tr} ${controller.printOrderType(listdata.ordersType!)}",
              ),
              Text("${'99'.tr} ${listdata.ordersPrice} \$"),
              Text("${'100'.tr} ${listdata.ordersPricedelivery} \$ "),
              Text(
                  "${'101'.tr}${controller.printPaymentMethod(listdata.ordersPaymentmethod!)} "),
              Text(
                  "${'102'.tr} ${controller.printOrderStatus(listdata.ordersStatus!)} "),
              const Divider(),
              Row(
                children: [
                  Text("${'70'.tr} : ${listdata.ordersId} \$ ",
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {
                      // Get.toNamed(AppRoutes.ordersdetails,
                      //     arguments: {"ordersmodel": listdata});
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.secondColor,
                    child: Text("104".tr),
                  ),
                  const SizedBox(width: 10),
                  if (listdata.ordersStatus! == "0")
                    MaterialButton(
                      onPressed: () {
                        controller.deleteOrder(listdata.ordersId!);
                      },
                      color: AppColor.thirdColor,
                      textColor: AppColor.secondColor,
                      child: Text("103".tr),
                    )
                ],
              ),
            ],
          )),
    );
  }
}
