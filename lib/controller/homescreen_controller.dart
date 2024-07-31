import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/view/screen/home.dart';
import 'package:k_mandi/view/screen/settings.dart';

abstract class HomeScreenController extends GetxController {
  // pour se deplacer entre les page (currentpage num l page l nahna fiha)
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  //asemi les pages l ch naviger binethom
  List bottomappbar = [
    {"title": "home", 'icon': Icons.home},
    {"title": "notif", 'icon': Icons.notifications_active_outlined},
    {"title": "profile", 'icon': Icons.person_outline_outlined},
    {"title": "settings", 'icon': Icons.settings},
  ];

  // les pages l bch naviger binethom fl homeScreen
 List<Widget> listPage = [
    const HomePage(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("Settings"))],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("Profile"))],
    ),
    const SettingsScreen()
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
