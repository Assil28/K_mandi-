import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:k_mandi/controller/home_controller.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/data/datasource/model/categoriesmodel.dart';
import 'package:k_mandi/linkapi.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      // nafsha listView.builder juste fama separateur bin les elements
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: controller.categories.length,
          //list view horizontal
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Categories(
              i : index,
              categoriesModel: CategoriesModel.fromJson(
                controller.categories[index],
              ),
            );
          }),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final int? i ;
  final CategoriesModel categoriesModel;
  const Categories({super.key, required this.categoriesModel,required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
            controller.goToItems(controller.categories,i!);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColor.thirdColor,
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            child: SvgPicture.network(
              "${LinkApi.imagesCategories}/${categoriesModel.categoriesImage}",
              color: AppColor.secondColor,
            ),
          ),
          Text(
            "${categoriesModel.categoriesName}",
            style: const TextStyle(fontSize: 13, color: AppColor.black),
          ),
        ],
      ),
    );
  }
}
