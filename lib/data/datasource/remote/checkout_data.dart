import 'package:k_mandi/core/class/crud.dart';
import 'package:k_mandi/linkapi.dart';

class CheckoutData {
  Crud crud;

  CheckoutData(this.crud);

  checkout(Map data) async {
    var response = await crud.postData(LinkApi.checkout, data);
    return response.fold((l) => l, (r) => r);
  }
}
