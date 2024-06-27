import 'package:k_mandi/core/class/crud.dart';
import 'package:k_mandi/linkapi.dart';

class CheckEmailData {
  Crud crud;

  CheckEmailData(this.crud);

  postdata(String email) async {
    var response = await crud.postData(LinkApi.checkEmail, {
      "email": email,
     });
    return response.fold((l) => l, (r) => r);
  }
}
