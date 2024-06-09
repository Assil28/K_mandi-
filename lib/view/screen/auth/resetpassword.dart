  import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/auth/forgetpassword_controller.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/view/widget/auth/custombuttonauth.dart';
import 'package:k_mandi/view/widget/auth/customtextbodyauth.dart';
import 'package:k_mandi/view/widget/auth/customtextformauth.dart';
import 'package:k_mandi/view/widget/auth/customtexttitleauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {

    // ForgetPasswordControllerImp controller= Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text("Forget Password",
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: AppColor.grey,
                  )),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: ListView(
            children: [
               CustomTextTitleAuth(
                text: "Check Email".tr,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextBodyAuth(
                text: "3".tr,
              ),
              const SizedBox(
                height: 45,
              ),
              

              // CustomTextFormAuth(
              //   hinttext: "6".tr, labeltext: "4".tr,
              //   icondata: Icons.email_outlined,
              //   mycontroller:controller.email
              // ),

            
              CustomButtonAuth(text: "check".tr, onPressed: () {}),
              const SizedBox(
                height: 30,
              ),
             
              
            ],
          ),
        ));
  }
}
