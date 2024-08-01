import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/cart_controller.dart';
import 'package:k_mandi/core/class/handlingdataview.dart';
import 'package:k_mandi/core/functions/translatedatabase.dart';
import 'package:k_mandi/view/widget/cart/appbarcart.dart';
import 'package:k_mandi/view/widget/cart/customitemscartlist.dart';
import 'package:k_mandi/view/widget/cart/topcardcart.dart';
import 'package:k_mandi/view/widget/cart/custom_bottom_navgationbar_cart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    //CartControllerImp cartController = Get.put(CartControllerImp());
    return Scaffold(
        bottomNavigationBar: GetBuilder<CartControllerImp>(
          builder: (controller) => BottomNavgationBarCart(
              price: "${controller.priceorders}",
              shipping: "300",
              totalprice: "1500"),
        ),
        body: GetBuilder<CartControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                TopAppbarCart(
                  title: '76'.tr,
                ),
                const SizedBox(height: 10),
                TopCardCart(
                    message:
                        "You Have ${controller.totalcountitems} Items in Your List"),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ...List.generate(
                        controller.data.length,
                        (index) => CustomItemsCartList(
                            onAdd: () async {
                              await controller
                                  .add(controller.data[index].itemsId!);
                              controller.refreshPage();
                            },
                            onRemove: () async {
                              await controller
                                  .delete(controller.data[index].itemsId!);
                              controller.refreshPage();
                            },
                            name: TranslateDataBase(
                                controller.data[index].itemsNameAr,
                                controller.data[index].itemsName),
                            price: "${controller.data[index].itemsprice} \$",
                            count: "${controller.data[index].countitems}",
                            imagename: "${controller.data[index].countitems}"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
