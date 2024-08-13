import 'package:get/get.dart';
import 'package:k_mandi/core/class/statusrequest.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:k_mandi/core/functions/handlingdatacontroller.dart';
import 'package:k_mandi/core/services/services.dart';
import 'package:k_mandi/data/datasource/model/addressmodel.dart';
import 'package:k_mandi/data/datasource/remote/address_data.dart';
import 'package:k_mandi/data/datasource/remote/checkout_data.dart';

abstract class CheckoutController extends GetxController {
  choosePaymentMethod(String val);
  chooseDeliveryType(String val);
  chooseShippingAddress(String val);
  getShippingAddress();

  checkout();
}

class CheckoutControllerImp extends CheckoutController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  String? paymentMethod;
  String? deliveryType;
  String addressid = "0";
  late String couponid;
  late String coupondiscount;
  late String priceorders;

  List<AddressModel> dataaddress = [];

  @override
  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  @override
  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  @override
  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }

  @override
  getShippingAddress() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("92".tr, "95".tr);
    }
    if (deliveryType == null) {
      return Get.snackbar("92".tr, "96".tr);
    }

    statusRequest = StatusRequest.loading;

    update();

    Map data = {
      "usersid": myServices.sharedPreferences.getString("id"),
      "addressid": addressid.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": "10",
      "ordersprice": priceorders,
      "couponid": couponid,
      "coupondiscount": coupondiscount.toString(),
      "paymentmethod": paymentMethod.toString()
    };

    var response = await checkoutData.checkout(data);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.toNamed(AppRoutes.homePage);
        Get.snackbar("93".tr, "94".tr);
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("92".tr, "59".tr);
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    coupondiscount = Get.arguments['discountCoupon'].toString();
    priceorders = Get.arguments['priceorder'];

    getShippingAddress();
    super.onInit();
  }
}
