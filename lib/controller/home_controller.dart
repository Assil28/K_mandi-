import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:k_mandi/core/class/statusrequest.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:k_mandi/core/functions/handlingdatacontroller.dart';
import 'package:k_mandi/core/services/services.dart';
import 'package:k_mandi/data/datasource/model/itemsmodel.dart';
import 'package:k_mandi/data/datasource/remote/home_data.dart';

abstract class HomeController extends SearchMixController {
  initialData();
  getData();
  goToItems(List catgories, int selectedCat, String categoryid);
}

class HomeControllerImp extends HomeController {
  //3malna appel l service mte3na bech najem nesta3mel sharedpreference l hatitha fih
  MyServices myServices = Get.find();
  String? username;
  String? id;

  String? lang;

  HomeData homeData = HomeData(Get.find());
  List categories = [];
  List items = [];
  List data = [];

// settings
  List settingsdata = [];

  late StatusRequest statusRequest;

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lan");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    initialData();

    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == " success") {
        // nejbed l catogies m data l jebtha mel back
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        //get settings (les textes constants )
        settingsdata.addAll(response['settings']['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    // pour faire refresh lel ui
    update();
  }

  @override
  goToItems(catgories, selectedCat, categoryid) {
    Get.toNamed(AppRoutes.items, arguments: {
      "categories": catgories,
      "selectedCat": selectedCat,
      "catid": categoryid
    });
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}

class SearchMixController extends GetxController {
  TextEditingController? search;

  List<ItemsModel> listdata = [];

  bool isSearch = false;

  late StatusRequest statusRequest;
  HomeData homedata = HomeData(Get.find());

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.searchData(search!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }


   onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }
}
