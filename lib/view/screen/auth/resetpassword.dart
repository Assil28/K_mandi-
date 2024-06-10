  import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/auth/forgetpassword_controller.dart';
import 'package:k_mandi/controller/auth/resetpassword_controller.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/view/widget/auth/custombuttonauth.dart';
import 'package:k_mandi/view/widget/auth/customtextbodyauth.dart';
import 'package:k_mandi/view/widget/auth/customtextformauth.dart';
import 'package:k_mandi/view/widget/auth/customtexttitleauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {

    ResetPasswordControllerImp controller= Get.put(ResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text("24".tr,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: AppColor.grey,
                  )),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: ListView(
            children: [
               CustomTextTitleAuth(
                text: "25".tr,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextBodyAuth(
                text: "26".tr,
              ),
              const SizedBox(
                height: 45,
              ),
              

              // CustomTextFormAuth(
              //   hinttext: "6".tr, labeltext: "4".tr,
              //   icondata: Icons.email_outlined,
              //   mycontroller:controller.email
              // ),

             CustomTextFormAuth(
                hinttext: "28".tr, labeltext: "5".tr,
                icondata: Icons.lock_outlined,
                mycontroller:controller.password
              ),

              CustomTextFormAuth(
                hinttext: "29".tr, labeltext: "5".tr,
                icondata: Icons.lock_outlined,
                mycontroller:controller.password
              ),
              CustomButtonAuth(text: "27".tr, onPressed: () {}),
              const SizedBox(
                height: 30,
              ),
             
              
            ],
          ),
        ));
  }
}
