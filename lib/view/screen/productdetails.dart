import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/productdetails_controller.dart';
import 'package:k_mandi/core/class/handlingdataview.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:k_mandi/view/widget/productdetails/priceandcount.dart';
import 'package:k_mandi/view/widget/productdetails/toppageproductdetails.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 40,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: AppColor.secondColor,
                onPressed: () {
                  Get.toNamed(AppRoutes.cart);
                },
                child: const Text(
                  "Go To Cart",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))),
        body: GetBuilder<ProductDetailsControllerImp>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      // l partie l fougeniya l fiha l card wel image Stack
                      const TopProductPageDetails(),
                      const SizedBox(
                        height: 100,
                      ),

                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${controller.itemsModel.itemsName}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                        color: AppColor.fourthColor,
                                      )),
                              const SizedBox(height: 10),
                              PriceAndCountItems(
                                  onAdd: () {
                                    controller.add();
                                  },
                                  onRemove: () {
                                    controller.remove();
                                  },
                                 // price: "${controller.itemsModel.itemsPrice}",
                                 //fl prix 3adit l prix aprés discount
                                  price: "${controller.itemsModel.itemsPriceDiscount}",
                                  count: "${controller.countitems}"),
                              const SizedBox(height: 10),
                              Text(
                                  "${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc}",
                                  style: Theme.of(context).textTheme.bodyLarge),
                              const SizedBox(height: 10),
                              // Text("Color",
                              //     style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                              //           color: AppColor.fourthColor,
                              //         )),

                              // const SizedBox(height: 10),

                              // // Liste des couleurs disponile
                              // const SubitemsList()
                            ]),
                      )
                    ],
                  ),
                )));
  }
}
