
import 'package:k_mandi/linkapi.dart';

import '../../../core/class/crud.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  
  getData(String id) async {
    var response = await crud.postData(LinkApi.items, {"id" : id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}