import 'package:get/get.dart';
import 'package:k_mandi/core/class/statusrequest.dart';
import 'package:k_mandi/core/functions/handlingdatacontroller.dart';
import 'package:k_mandi/core/services/services.dart';
import 'package:k_mandi/data/datasource/model/myfavoritemodel.dart';
import 'package:k_mandi/data/datasource/remote/myfavorite_data.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteData myfavoriteData = MyFavoriteData(Get.find());

  List<MyFavoriteModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  getData() async {
    //data.clear();
    statusRequest = StatusRequest.loading;
    var response = await myfavoriteData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List responseData = response['data'];

        data.addAll(responseData.map((e) => MyFavoriteModel.fromJson(e)));
        print("data :");
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteFromFavorite(String favoriteid) {
    var response = myfavoriteData.deleteData(favoriteid);
    data.removeWhere((element) => element.favoriteId == favoriteid);
    update();
  }


  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
