import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:k_mandi/linkapi.dart';

import '../../../core/constant/color.dart';
import '../../../data/datasource/model/itemsmodel.dart';

class CustomListItems extends StatelessWidget {
  final ItemsModel itemsModel;
  const CustomListItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl: LinkApi.imagesItems + "/" + itemsModel.itemsImage!,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                 const SizedBox(height: 10) ,
                  Text(itemsModel.itemsName!,
                      style: const TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Rating 3.5 ", textAlign: TextAlign.center),
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 22,
                        child: Row(
                          children: [
                            ...List.generate(
                                5,
                                    (index) =>const Icon(
                                  Icons.star,
                                  size: 15,
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${itemsModel.itemsPrice} \$",
                          style:const TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "sans")),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite,
                            color: AppColor.primaryColor,
                          ))
                    ],
                  )
                ]),
          ),
        ));
  }
}