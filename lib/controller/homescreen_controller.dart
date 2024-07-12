import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/view/screen/home.dart';

abstract class HomeScreenController extends GetxController{

  // pour se deplacer entre les page (currentpage num l page l nahna fiha)
  changePage(int currentpage);

}


class HomeScreenControllerImp extends HomeScreenController{
  int currentpage = 0;

    //asemi les pages l ch naviger binethom
    List  titlebottomappbar = [
      "home" ,
      "settings" ,
      "profile" ,
      "favorite"
    ] ;

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
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text("Favorite"))],
      )
    ];

    @override
    changePage(int i) {
      currentpage = i;
      update();
    }


}