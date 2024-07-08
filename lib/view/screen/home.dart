import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/home_controller.dart';
import 'package:k_mandi/core/class/handlingdataview.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/linkapi.dart';
import 'package:k_mandi/view/widget/home/customappbar.dart';
import 'package:k_mandi/view/widget/home/customcardhome.dart';
import 'package:k_mandi/view/widget/home/customtitlehome.dart';
import 'package:k_mandi/view/widget/home/listcategorieshome.dart';
import 'package:k_mandi/view/widget/home/listitemshome.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());

    return Scaffold(
        appBar: AppBar(
            //title: Text('${controller.username}'),
            ),
        body: GetBuilder<HomeControllerImp>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ListView(
                      children: [
                        //1ér partie customAppBar ( recherche l fouganeya )
                        CustomAppBar(
                          title: "61".tr,
                          onPressedIcon: () {},
                          onPressedSearch: () {},
                        ),

                        //2ém partie
                        CustomCardHome(title: "62".tr, body: "63".tr),

                        //3ém PArtie listView catgories
                        const ListCategoriesHome(),

                        const SizedBox(
                          height: 10,
                        ),

                        //4ém partie (ProductFor u)
                        CustomTitleHome(title: "64".tr),

                        const SizedBox(
                          height: 10,
                        ),

                        //5ém Partie (liste des produit)
                         const ListItemsHome(),
                      ],
                    ),
                  ),
                )));
  }
}
