import 'package:get/get.dart';
import 'package:k_mandi/controller/cart_controller.dart';
import 'package:k_mandi/core/class/statusrequest.dart';
import 'package:k_mandi/data/datasource/model/itemsmodel.dart';

abstract class ProductDetailsController extends GetxController {
  //ces deux fonctions dedié pour la vue , lorsque je clique sur + le nombre incrémenete directement
  add();
  remove();
}

class ProductDetailsControllerImp extends ProductDetailsController {
//injection lel cartcontroller pour ajouter et effacer le produit du panier
  CartControllerImp cartController = Get.put(CartControllerImp());

  late ItemsModel itemsModel;

  late StatusRequest statusRequest;

  int countitems = 0;

  List subitems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'}
  ];

  @override
  add() {
    //pour la BD
    cartController.add(itemsModel.itemsId!);
    //Pour l View
    countitems++;
    update();
  }

  @override
  remove() {
    if (countitems > 0) {
      // pour la BD
      cartController.delete(itemsModel.itemsId!);
      //pour l view
      countitems--;
      update();
    }
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  initialData() async {
    statusRequest = StatusRequest.loading;

    itemsModel = Get.arguments['itemsmodel'];
    countitems = await cartController.getCountItems(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }
}
