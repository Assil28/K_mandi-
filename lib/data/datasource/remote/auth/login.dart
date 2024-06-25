import 'package:k_mandi/core/class/crud.dart';
import 'package:k_mandi/linkapi.dart';

class LoginData {
  Crud crud;

  LoginData(this.crud);

  postdata(String email, String password) async {
    var response = await crud.postData(LinkApi.login, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
