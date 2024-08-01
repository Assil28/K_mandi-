import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/productdetails_controller.dart';
import 'package:k_mandi/core/constant/color.dart';
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
                onPressed: () {},
                child: const Text(
                  "Add To Cart",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))),
        body: ListView(children: [
          // l partie l fougeniya l fiha l card wel image Stack
          const TopProductPageDetails(),
          const SizedBox(
            height: 100,
          ),

          Container(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("${controller.itemsModel.itemsName}",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: AppColor.fourthColor,
                      )),
              const SizedBox(height: 10),
              PriceAndCountItems(
                  onAdd: () {
                    controller.cartController
                        .add(controller.itemsModel.itemsId!);
                  },
                  onRemove: () {
                    controller.cartController
                        .delete(controller.itemsModel.itemsId!);
                  },
                  price: "${controller.itemsModel.itemsPrice}",
                  count: "2"),
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
        ]));
  }
}
