import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/core/class/statusrequest.dart';
import 'package:k_mandi/core/functions/handlingdatacontroller.dart';
import 'package:k_mandi/core/services/services.dart';
import 'package:k_mandi/data/datasource/remote/favorite_data.dart';

class FavoriteController extends GetxController {

  FavoriteData favoriteData = FavoriteData(Get.find());
  Map isFavoite = {};

  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  setFavorite(id, val) {
    isFavoite[id] = val;
    update();
  }

  addFavorite(String itemsId) async {
    //data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        myServices.sharedPreferences.getString("id")!,itemsId);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
       // data.addAll(response['data']);
       Get.rawSnackbar(title: "49".tr,messageText: Text("66".tr));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }

  }

  removeFavorite(String itemsId) async{
    // data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        myServices.sharedPreferences.getString("id")!,itemsId);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
       // data.addAll(response['data']);$
              Get.rawSnackbar(title: "49".tr,messageText: Text("67".tr));

      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
  }
}
