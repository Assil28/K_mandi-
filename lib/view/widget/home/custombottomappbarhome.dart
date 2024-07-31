
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/homescreen_controller.dart';

import 'custombuttomappbar.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => BottomAppBar(
          //fazet l 9assa bin lelement l fl west w lokhrin (shape w notch)
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
              children: [
                ...List.generate(controller.listPage.length + 1, ((index) {
                  int i = index > 2 ? index - 1 : index;
                  return index == 2  // bch ngolo ken l index ==2 ya3meli spacer bch tjini heki nocht
                      ? const Spacer()
                      : CustomButtonAppBar(
                      textbutton: controller.bottomappbar[i]['title'],
                      icondata: controller.bottomappbar[i]['icon'],
                      onPressed: () {
                        controller.changePage(i);
                      },
                      active: controller.currentpage == i ? true : false);
                }))
              ],
            )));
  }
}