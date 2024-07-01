import 'package:k_mandi/core/class/crud.dart';
import 'package:k_mandi/linkapi.dart';

class HomeData {

  Crud crud;

  HomeData(this.crud);

  getData()async{
    var response = await crud.postData(LinkApi.homepage, {});
    return response.fold((l) => l, (r) => r);
  }
}