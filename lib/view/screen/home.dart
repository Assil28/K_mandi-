import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/home_controller.dart';
import 'package:k_mandi/core/class/handlingdataview.dart';
import 'package:k_mandi/core/constant/routes.dart';
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
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ListView(
                      children: [
                        //1ér partie customAppBar ( recherche l fouganeya w les boutton l bejnabha )
                        CustomAppBar(
                          title: "61".tr,
                          //onPressedIcon: () {},
                          onPressedSearch: () {},
                          onPressedIconFavorite: (){
                            Get.toNamed(AppRoutes.myfavorite);
                          },
                        ),

                        //2ém partie
                        CustomCardHome(title: "62".tr, body: "63".tr),

                        //3ém PArtie listView catgories
                        CustomTitleHome(title: "65".tr),


                        const ListCategoriesHome(),


                        //4ém partie (ProductFor u)
                        CustomTitleHome(title: "64".tr),

                        //5ém Partie (liste des produit)
                         const ListItemsHome(),
                      ],
                    ),
                  ),
                ));
  }
}
