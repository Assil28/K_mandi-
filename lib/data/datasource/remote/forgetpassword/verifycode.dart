import 'package:k_mandi/core/class/crud.dart';
import 'package:k_mandi/linkapi.dart';

class VerifyCodeForgetPasswordData {
  Crud crud;

  VerifyCodeForgetPasswordData(this.crud);

  postdata(String email, String verifycode) async {
    var response = await crud.postData(LinkApi.verifyCodeForgetPassword, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}