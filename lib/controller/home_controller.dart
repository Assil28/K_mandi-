import 'package:get/get.dart';
import 'package:k_mandi/core/class/statusrequest.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:k_mandi/core/functions/handlingdatacontroller.dart';
import 'package:k_mandi/core/services/services.dart';
import 'package:k_mandi/data/datasource/remote/home_data.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
  goToItems(List catgories,int selectedCat);
}

class HomeControllerImp extends HomeController {
  //3malna appel l service mte3na bech najem nesta3mel sharedpreference l hatitha fih
  MyServices myServices = Get.find();
  String? username;
  String? id;

  HomeData homeData = HomeData(Get.find());
  List categories = [];
  List items = [];
  List data = [];

  late StatusRequest statusRequest;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    initialData();
    getData();
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
        categories.addAll(response['categories']);
         items.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    // pour faire refresh lel ui
    update();
  }

  @override
  goToItems( catgories, selectedCat) {
   Get.toNamed(AppRoutes.items,arguments:
      {
        "categories" : catgories,
        "selectedCat": selectedCat
      }

   );
  }
}
