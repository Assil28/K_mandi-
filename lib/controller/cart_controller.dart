import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:k_mandi/core/class/statusrequest.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:k_mandi/core/functions/handlingdatacontroller.dart';
import 'package:k_mandi/core/services/services.dart';
import 'package:k_mandi/data/datasource/model/cartmodel.dart';
import 'package:k_mandi/data/datasource/model/couponmodel.dart';
import 'package:k_mandi/data/datasource/remote/cart_data.dart';

abstract class CartController extends GetxController {
  add(String itemsId);

  delete(String itemsId);

  view();

  checkCoupon();

  getTotalPrice();

  goToPageCheckout();
}

class CartControllerImp extends CartController {
  TextEditingController? controllercoupon;

  CartData cartData = CartData(Get.find());

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  List<CartModel> data = [];

  double priceorders = 0.0;

  int totalcountitems = 0;

  CouponModel? couponModel;

  String? couponName;
  String? couponid;
  double? discountCoupon = 0;

  @override
  add(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(title: "49".tr, messageText: Text("72".tr));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  delete(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(title: "49".tr, messageText: Text("73".tr));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  resetVarCart() {
    totalcountitems = 0;
    priceorders = 0.0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  @override
  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.viewCart(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          List dataresponse = response['datacart']['data'];
          Map dataresponsecountprice = response['countprice'];
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalcountitems = int.parse(dataresponsecountprice['totalcount']);
          priceorders = double.parse(dataresponsecountprice['totalprice']);
          print(priceorders);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    view();
    super.onInit();
  }

  @override
  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.checkCoupon(controllercoupon!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountCoupon = double.parse(couponModel!.couponDiscount!);
        couponName = couponModel!.couponName;
        couponid = couponModel!.couponId;
      } else {
        // ken me famech coupon bel isem hedheka
        discountCoupon = 0.0;
        couponName = null;
        couponid = null;
        Get.snackbar("53".tr, "97".tr);
      }
    }
    update();
  }

  @override
  getTotalPrice() {
    return (priceorders - priceorders * discountCoupon! / 100);
  }

  @override
  goToPageCheckout() {
    if (data.isEmpty) return Get.snackbar("49".tr, "91".tr);
    Get.toNamed(AppRoutes.checkout, arguments: {
      "couponid": couponid ?? "0",
      "priceorder": priceorders.toString(),
      "discountCoupon": discountCoupon.toString(),
    });
  }
}
