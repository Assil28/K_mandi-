import 'package:get/get.dart';
import 'package:k_mandi/data/datasource/model/itemsmodel.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemsModel itemsModel;

  @override
  void onInit() {
    initialData();

    super.onInit();
  }

  initialData() {
    itemsModel = Get.arguments['itemsmodel'];
  }
}
