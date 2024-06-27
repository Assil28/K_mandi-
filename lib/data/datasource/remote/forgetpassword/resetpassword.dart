import 'package:k_mandi/core/class/crud.dart';
import 'package:k_mandi/linkapi.dart';

class ResetPasswordData {
  Crud crud;

  ResetPasswordData(this.crud);

  postdata(String email, String password) async {
    var response = await crud.postData(LinkApi.resetPassword, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}