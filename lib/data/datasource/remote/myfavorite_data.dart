
import 'package:k_mandi/linkapi.dart';

import '../../../core/class/crud.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);

  

   getData(String id) async {
    var response = await crud.postData(LinkApi.favoriteView, {"id" : id});
    return response.fold((l) => l, (r) => r);
  }

   deleteData(String id) async {
    var response = await crud.postData(LinkApi.deletefromfavorite, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}