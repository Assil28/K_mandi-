import 'package:k_mandi/core/class/crud.dart';
import 'package:k_mandi/linkapi.dart';

class OrdersArchiveData {
  Crud crud;

  OrdersArchiveData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(LinkApi.ordersarchive, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }

 
}