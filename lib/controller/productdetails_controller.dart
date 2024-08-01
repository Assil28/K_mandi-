import 'package:get/get.dart';
import 'package:k_mandi/controller/cart_controller.dart';
import 'package:k_mandi/data/datasource/model/itemsmodel.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {


//injection lel cartcontroller pour ajouter et effacer le produit du panier
CartControllerImp cartController = Get.put(CartControllerImp());

  late ItemsModel itemsModel;

    List subitems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'}
  ];

  @override
  void onInit() {
    initialData();

    super.onInit();
  }

  initialData() {
    itemsModel = Get.arguments['itemsmodel'];
  }
}
