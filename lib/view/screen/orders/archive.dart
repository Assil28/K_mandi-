import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/orders/archive_controller.dart';
import 'package:k_mandi/core/class/handlingdataview.dart';
import 'package:k_mandi/view/widget/orders/orderslistarchive.dart';

class OrdersArchiveView extends StatelessWidget {
  const OrdersArchiveView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OrdersArchiveController());
    return Scaffold(
        appBar: AppBar(
          title: Text('111'.tr),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<OrdersArchiveController>(
              builder: ((controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: ((context, index) => CardOrdersListArchive(
                        listdata: controller.data[index])),
                  )))),
        ));
  }
}
