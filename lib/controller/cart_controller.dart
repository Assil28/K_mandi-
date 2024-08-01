import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/core/class/statusrequest.dart';
import 'package:k_mandi/core/functions/handlingdatacontroller.dart';
import 'package:k_mandi/core/services/services.dart';
import 'package:k_mandi/data/datasource/remote/cart_data.dart';

abstract class CartController extends GetxController {
  add(String itemsId);

  delete(String itemsId);

  view();
}

class CartControllerImp extends CartController {
  CartData cartData = CartData(Get.find());

  Map isFavoite = {};

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  @override
  add(String itemsId) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsId);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(title: "49".tr, messageText: Text("72".tr));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
  }

  @override
  delete(String itemsId) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString("id")!, itemsId);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(title: "49".tr, messageText: Text("73".tr));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }}

  @override
  view() {}
}
