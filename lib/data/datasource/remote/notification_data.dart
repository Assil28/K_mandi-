import 'package:k_mandi/core/class/crud.dart';
import 'package:k_mandi/linkapi.dart';

class NotificationData {
  Crud crud;

  NotificationData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(LinkApi.notification, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }
}
