import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/items_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../data/datasource/model/itemsmodel.dart';
import '../widget/customappbar.dart';
import '../widget/items/customlistitems.dart';
import '../widget/items/listcategoriesitems.dart';


class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());

    return Scaffold(
      body: Container(
        padding:const EdgeInsets.all(15),
        child: GetBuilder<ItemsControllerImp>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [

                  //1ér partie customAppBar ( recherche l fouganeya )
                  CustomAppBar(
                      title: "Find Product",
                      onPressedIcon: () {},
                      onPressedSearch: () {}),

                  const SizedBox(height: 20),

                  // 2ém partie (listCategoriesItems)
                  const ListCategoriesItems(),

                  //3ém partie
                  GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:controller.data.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (BuildContext context, index) {
                        return CustomListItems(
                            itemsModel:
                            ItemsModel.fromJson(controller.data[index]));
                      })
                ]))),
      ),
    );
  }
}