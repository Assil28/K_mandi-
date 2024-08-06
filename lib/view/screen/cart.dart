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
    CartControllerImp cartController = Get.put(CartControllerImp());
    return Scaffold(
        bottomNavigationBar: GetBuilder<CartControllerImp>(
            builder: (controller) => BottomNavgationBarCart(
                  price: "${cartController.priceorders}",
                  discount: "10 %",
                  shipping: "${cartController.discountCoupon}",
                  totalprice: "${cartController.getTotalPrice()}",
                  controllercoupon: controller.controllercoupon!,
                  onApplyCoupon: () {
                    controller.checkCoupon();
                  },
                )),
        body: GetBuilder<CartControllerImp>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    TopAppbarCart(
                      title: '76'.tr,
                    ),
                    const SizedBox(height: 10),
                    TopCardCart(
                        message:
                            "You Have ${cartController.totalcountitems} Items in Your List"),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ...List.generate(
                            cartController.data.length,
                            (index) => CustomItemsCartList(
                                onAdd: () async {
                                  await cartController
                                      .add(cartController.data[index].itemsId!);
                                  cartController.refreshPage();
                                },
                                onRemove: () async {
                                  await cartController.delete(
                                      cartController.data[index].itemsId!);
                                  cartController.refreshPage();
                                },
                                imagename:
                                    "${cartController.data[index].itemsImage}",
                                name: TranslateDataBase(
                                    controller.data[index].itemsNameAr,
                                    controller.data[index].itemsName),
                                price:
                                    "${cartController.data[index].itemsprice} \$",
                                count:
                                    "${cartController.data[index].countitems}"),
                          )
                        ],
                      ),
                    )
                  ],
                )))));
  }
}
