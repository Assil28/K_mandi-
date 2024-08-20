import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/home_controller.dart';
import 'package:k_mandi/core/class/handlingdataview.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:k_mandi/data/datasource/model/itemsmodel.dart';
import 'package:k_mandi/linkapi.dart';
import 'package:k_mandi/view/widget/customappbar.dart';
import 'package:k_mandi/view/widget/home/customcardhome.dart';
import 'package:k_mandi/view/widget/home/customtitlehome.dart';
import 'package:k_mandi/view/widget/home/listcategorieshome.dart';
import 'package:k_mandi/view/widget/home/listitemshome.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            //1ér partie customAppBar ( recherche l fouganeya w les boutton l bejnabha )
            CustomAppBar(
              mycontroller: controller.search!,
              onChanged: (val) {
                controller.checkSearch(val);
              },
              title: "61".tr,
              //onPressedIcon: () {},
              onPressedSearch: () {
                controller.onSearchItems();
              },
              onPressedIconFavorite: () {
                Get.toNamed(AppRoutes.myfavorite);
              },
            ),

            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: !controller.isSearch
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //2ém partie
                        // hedhi k kenet nejbed f title static (constant)
                        //CustomCardHome(title: "62".tr, body: "63".tr),

                        //2ém partie
                        // hedhi k kenet nejbed f title dynamic (mel BD)
                        if (controller.settingsdata.isNotEmpty)
                          CustomCardHome(
                              title:
                                  "${controller.settingsdata[0]['settings_titlehome']}"
                                      .tr,
                              body:
                                  "${controller.settingsdata[0]['settings_titlebody']}"
                                      .tr),

                        //3ém PArtie listView catgories
                        CustomTitleHome(title: "65".tr),

                        const ListCategoriesHome(),

                        //4ém partie (ProductFor u)
                        CustomTitleHome(title: "118".tr),

                        //5ém Partie (liste des produit)
                        const ListItemsHome(),
                      ],
                    )
                  : ListItemsSearch(
                      listdatamodel: controller.listdata,
                    ),
            )
          ],
        ),
      ),
    );
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({Key? key, required this.listdatamodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProductDetails(listdatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                  child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${LinkApi.imagesItems}/${listdatamodel[index].itemsImage}")),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(listdatamodel[index].itemsName!),
                          subtitle: Text(listdatamodel[index].categoriesName!),
                        )),
                  ],
                ),
              )),
            ),
          );
        });
  }
}
