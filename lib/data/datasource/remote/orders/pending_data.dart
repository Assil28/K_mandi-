import 'package:k_mandi/core/class/crud.dart';
import 'package:k_mandi/linkapi.dart';

class OrdersPendingData {
  Crud crud;

  OrdersPendingData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(LinkApi.pendingorders, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String orderid) async {
    var response = await crud.postData(LinkApi.ordersdelete, {"id": orderid});
    return response.fold((l) => l, (r) => r);
  }
}
