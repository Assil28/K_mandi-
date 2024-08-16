import 'package:k_mandi/core/class/crud.dart';
import 'package:k_mandi/linkapi.dart';

class OffersData {

  Crud crud;

  OffersData(this.crud);

  getData()async{
    var response = await crud.postData(LinkApi.offers, {});
    return response.fold((l) => l, (r) => r);
  }
}