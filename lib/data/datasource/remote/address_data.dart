import 'package:k_mandi/core/class/crud.dart';
import 'package:k_mandi/linkapi.dart';

class AddressData {
  Crud crud;

  AddressData(this.crud);

  getData(String usersid) async {
    var response = await crud.postData(LinkApi.addressView, {
      "user_id": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }

  addData(String usersid, String name, String city, String street, String lat,
      String long) async {
    var response = await crud.postData(LinkApi.addressAdd, {
      "user_id": usersid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String addressid) async {
    var response =
        await crud.postData(LinkApi.addressDelete, {"addressid": addressid});
    return response.fold((l) => l, (r) => r);
  }
}
