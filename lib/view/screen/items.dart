import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/favorite_controller.dart';
import 'package:k_mandi/controller/items_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../data/datasource/model/itemsmodel.dart';
import '../widget/customappbar.dart';
import '../widget/items/customlistitems.dart';
import '../widget/items/listcategoriesitems.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(children: [
          //1ér partie customAppBar ( recherche l fouganeya )
          CustomAppBar(
            title: "Find Product",
           // onPressedIcon: () {},
            onPressedSearch: () {},
            onPressedIconFavorite: () {},
          ),

          const SizedBox(height: 20),

          // 2ém partie (listCategoriesItems)
          const ListCategoriesItems(),

          GetBuilder<ItemsControllerImp>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget:

                      //3ém partie
                      GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.7),
                          itemBuilder: (BuildContext context, index) {
                            controllerFav.isFavoite[controller.data[index]
                                    ['items_id']] ==
                                controller.data[index]['favorite'];

                            return CustomListItems(
                                itemsModel: ItemsModel.fromJson(
                                    controller.data[index]));
                          })))
        ]),
      ),
    );
  }
}
