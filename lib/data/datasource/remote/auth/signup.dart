import 'package:k_mandi/core/class/crud.dart';
import 'package:k_mandi/linkapi.dart';

class SignUpData {

  Crud crud;

  SignUpData(this.crud);

  postdata(String username,String password,String email,String phone)async{
    var response = await crud.postData(LinkApi.signUp, {
       "username": username,
       "password": password,
       "email": email,
       "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}