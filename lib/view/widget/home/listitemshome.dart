import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/home_controller.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/data/datasource/model/itemsmodel.dart';
import 'package:k_mandi/linkapi.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ItemsHome(
                itemsModel: ItemsModel.fromJson(controller.items[index]));
          }),
    );
  }
}

class ItemsHome extends StatelessWidget {
  final ItemsModel itemsModel;
  const ItemsHome({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Image.network(
            "${LinkApi.imagesItems}/${itemsModel.itemsImage}",
            height: 100,
            width: 150,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: AppColor.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20)),
          height: 120,
          width: 200,
        ),
        Positioned(
            left: 10,
            child: Text(
              "${itemsModel.itemsName}",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ))
      ],
    );
  }
}
