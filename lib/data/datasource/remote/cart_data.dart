import 'package:k_mandi/linkapi.dart';

import '../../../core/class/crud.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  addCart(String usersid, String itemsid) async {
    var response = await crud
        .postData(LinkApi.cartadd, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String usersid, String itemsid) async {
    var response = await crud
        .postData(LinkApi.cartdelete, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  getCountCart(String usersid, String itemsid) async {
    var response = await crud.postData(
        LinkApi.cartgetcountitems, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String usersid) async {
    var response = await crud.postData(LinkApi.cartview, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponname) async  {
    var response = await crud.postData(LinkApi.checkcoupon, {"couponname": couponname});
    return response.fold((l) => l, (r) => r);
  }
}
