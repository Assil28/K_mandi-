import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/favorite_controller.dart';
import 'package:k_mandi/controller/items_controller.dart';
import 'package:k_mandi/core/constant/imageassets.dart';
import 'package:k_mandi/core/functions/translatedatabase.dart';
import 'package:k_mandi/linkapi.dart';

import '../../../core/constant/color.dart';
import '../../../data/datasource/model/itemsmodel.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
//  final bool active;
  const CustomListItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.gotToPageProductDetails(itemsModel);
        },
        child: Card(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                        tag: "${itemsModel.itemsId}",
                        child: CachedNetworkImage(
                          imageUrl: LinkApi.imagesItems +
                              "/" +
                              itemsModel.itemsImage!,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                          TranslateDataBase(
                              itemsModel.itemsNameAr!, itemsModel.itemsName!),
                          style: const TextStyle(
                              color: AppColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     const Text("Rating 3.5 ",
                      //         textAlign: TextAlign.center),
                      //     Container(
                      //       alignment: Alignment.bottomCenter,
                      //       height: 22,
                      //       child: Row(
                      //         children: [
                      //           ...List.generate(
                      //               5,
                      //               (index) => const Icon(
                      //                     Icons.star,
                      //                     size: 15,
                      //                   ))
                      //         ],
                      //       ),
                      //     )
                      //   ],
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //hedha l prix du produit menghir discount
                          // Text("${itemsModel.itemsPrice} \$",
                          //     style: const TextStyle(
                          //         color: AppColor.primaryColor,
                          //         fontSize: 16,
                          //         fontWeight: FontWeight.bold,
                          //         fontFamily: "sans")),

                          // l prix du produit avec discount
                          Text("${itemsModel.itemsPriceDiscount} \$",
                              style: const TextStyle(
                                  color: AppColor.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "sans")),
                          GetBuilder<FavoriteController>(
                            builder: (controller) => IconButton(
                              onPressed: () {
                                if (controller.isFavoite[itemsModel.itemsId] ==
                                    "1") {
                                  controller.setFavorite(
                                      itemsModel.itemsId, "0");
                                  controller
                                      .removeFavorite(itemsModel.itemsId!);
                                } else {
                                  controller.setFavorite(
                                      itemsModel.itemsId, "1");
                                  controller.addFavorite(itemsModel.itemsId!);
                                }
                              },
                              icon: Icon(
                                controller.isFavoite[itemsModel.itemsId] == "1"
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    ]),
              ),

              //lehna gotlo ken l produit fih discount bch yafficher l image discount m3ah sinon le 
              if (itemsModel.itemsDiscount != "0")
                Positioned(
                  top: 4,
                  left: 4,
                  child: Image.asset(
                    AppImageAsset.saleOne,
                    width: 40,
                  ),
                )
            ],
          ),
        ));
  }
}
