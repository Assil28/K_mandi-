import 'package:k_mandi/core/class/crud.dart';
import 'package:k_mandi/linkapi.dart';

class TestData {

  Crud crud;

  TestData(this.crud);

  getData()async{
    var response = await crud.postData(LinkApi.test, {});
    return response.fold((l) => l, (r) => r);
  }
}