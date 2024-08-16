import 'package:k_mandi/core/class/crud.dart';
import 'package:k_mandi/linkapi.dart';

class OrdersDetailsData {
  Crud crud;
  OrdersDetailsData(this.crud);
  getData(String id) async {
    var response = await crud.postData(LinkApi.ordersdetails, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}