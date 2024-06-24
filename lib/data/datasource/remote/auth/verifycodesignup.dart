import 'package:k_mandi/core/class/crud.dart';
import 'package:k_mandi/linkapi.dart';

class VerifyCodeSignUpData {

  Crud crud;

  VerifyCodeSignUpData(this.crud);

  postdata(String email,String verifycode)async{
    var response = await crud.postData(LinkApi.signUp, {
       "email": email,
       "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}