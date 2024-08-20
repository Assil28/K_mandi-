import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/checkout_controller.dart';
import 'package:k_mandi/core/class/handlingdataview.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/core/constant/imageassets.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:k_mandi/view/widget/checkout/carddeliveerytype.dart';
import 'package:k_mandi/view/widget/checkout/cardpaymentmethod.dart';
import 'package:k_mandi/view/widget/checkout/cardshippingaddress.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutControllerImp controller = Get.put(CheckoutControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text('84'.tr),
      ),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            color: AppColor.secondColor,
            textColor: Colors.white,
            onPressed: () {
              controller.checkout();
            },
            child: Text(
              "84".tr,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          )),
      body: GetBuilder<CheckoutControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                // choisir la methodes du paiement
                Text(
                  "85".tr,
                  style: const TextStyle(
                      color: AppColor.secondColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    // pour choisir la methode du payement cash ( 0 = cash )
                    controller.choosePaymentMethod("0");
                  },
                  child: CardPaymentMethodCheckout(
                      title: "86".tr,
                      isActive: controller.paymentMethod == "0" ? true : false),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    // pour choisir la methode du payement par card ( 1 = card )
                    controller.choosePaymentMethod("1");
                  },
                  child: CardPaymentMethodCheckout(
                      title: "87".tr,
                      isActive: controller.paymentMethod == "1" ? true : false),
                ),
                /**************** */

                // Choisir la methodes du livraison
                const SizedBox(height: 20),
                Text(
                  "88".tr,
                  style: const TextStyle(
                      color: AppColor.secondColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // pour choisir la methode du recuperation du produit par delivery ( 0 = delivery )
                        controller.chooseDeliveryType("0");
                      },
                      child: CardDeliveryTypeCheckout(
                          imagename: AppImageAsset.deliveryImage2,
                          title: "89".tr,
                          active:
                              controller.deliveryType == "0" ? true : false),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        // pour choisir la methode du recuperation du produit on personne (sur place) (1 = receive )
                        controller.chooseDeliveryType("1");
                      },
                      child: CardDeliveryTypeCheckout(
                          imagename: AppImageAsset.drivethruImage,
                          title: "Revice",
                          active:
                              controller.deliveryType == "1" ? true : false),
                    ),
                  ],
                ),
                /****************** */

                // If delivery => les Adresses du client
                const SizedBox(height: 20),
                if (controller.deliveryType == "0")
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (controller.dataaddress.isNotEmpty)
                        Text(
                          "90".tr,
                          style: const TextStyle(
                              color: AppColor.secondColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      if (controller.dataaddress.isEmpty)
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRoutes.addressadd);
                          },
                          child: Container(
                            child: Center(
                                child: Text(
                              "${"119".tr} \n Click Here",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      const SizedBox(height: 10),
                      ...List.generate(
                        controller.dataaddress.length,
                        (index) => InkWell(
                          onTap: () {
                            // choisir ladresse dans laquelle il reçoi le produit
                            controller.chooseShippingAddress(
                                controller.dataaddress[index].addressId!);
                          },
                          child: CardShppingAddressCheckout(
                              title:
                                  "${controller.dataaddress[index].addressName}",
                              body:
                                  "${controller.dataaddress[index].addressCity} ${controller.dataaddress[index].addressStreet}",
                              isactive: controller.addressid ==
                                      controller.dataaddress[index].addressId
                                  ? true
                                  : false),
                        ),
                      )

                      /******Les Adresses du client */
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
