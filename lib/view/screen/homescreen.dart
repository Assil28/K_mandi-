import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/homescreen_controller.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:k_mandi/view/widget/home/custombottomappbarhome.dart';

import '../../core/constant/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());


    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
          // l botton l jeya f west l bottomNavBar
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.primaryColor,
              onPressed: () {
                Get.toNamed(AppRoutes.cart);
              },
              child: const Icon(Icons.shopping_basket_outlined)),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: const CustomBottomAppBarHome(),

          // hne 3ayetet lel les pages l bch naviger binethom   wel bottomNavBar tab9a fix
          body: controller.listPage.elementAt(controller.currentpage),
        ));
  }
}
