import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:k_mandi/controller/orders/details_controller.dart';
import 'package:k_mandi/core/class/handlingdataview.dart';
import 'package:k_mandi/core/constant/color.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController ordersDetailsController =
        Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("113".tr),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<OrdersDetailsController>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                                    // Partie loula liste des ordres

                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Table(
                            children: [
                              TableRow(children: [
                                Text("114".tr,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold)),
                                Text("115".tr,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold)),
                                Text("69".tr,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold)),
                              ]),

                              // TableRow(children: [
                              //   Text("Macbook m1", textAlign: TextAlign.center),
                              //   Text("2", textAlign: TextAlign.center),
                              //   Text("1200", textAlign: TextAlign.center),
                              // ]),
                              ...List.generate(
                                controller.data.length,
                                (index) => TableRow(
                                  children: [
                                    Text("${controller.data[index].itemsName}",
                                        textAlign: TextAlign.center),
                                    Text("${controller.data[index].countitems}",
                                        textAlign: TextAlign.center),
                                    Text("${controller.data[index].itemsprice}",
                                        textAlign: TextAlign.center),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Prix Total
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                                "${'70'.tr} : ${controller.ordersModel.ordersTotalprice}\$",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (controller.ordersModel.ordersType == "0")
                    // Partie Shipping Adress
                    Card(
                      child: Container(
                        child: ListTile(
                          title: Text('90'.tr,
                              style: const TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text(
                              "${controller.ordersModel.addressCity} ${controller.ordersModel.addressStreet}"),
                        ),
                      ),
                    ),
                  if (controller.ordersModel.ordersType == "0")
                    // Partie l map
                    Card(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        height: 300,
                        width: double.infinity,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          markers: controller.markers.toSet(),
                          initialCameraPosition: controller.cameraPosition!,
                          onMapCreated: (GoogleMapController controllermap) {
                            controller.completercontroller!
                                .complete(controllermap);
                          },
                        ),
                      ),
                    )
                ])))),
      ),
    );
  }
}
