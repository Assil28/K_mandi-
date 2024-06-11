import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/auth/signup_controller.dart';
import 'package:k_mandi/controller/auth/successresetpassword_controller.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/view/widget/auth/custombuttonauth.dart';
import 'package:k_mandi/view/widget/auth/customtextbodyauth.dart';
import 'package:k_mandi/view/widget/auth/customtexttitleauth.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key}); 
  @override
  Widget build(BuildContext context) {
        SuccessResetPasswordControllerImp controller= Get.put(SuccessResetPasswordControllerImp() );

    return  Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text("34".tr,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: AppColor.grey,
                  )),
        ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child:  Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              const Center(child: Icon(Icons.check_circle_outline,size: 200,color: AppColor.primaryColor,)) ,

               CustomTextTitleAuth(
                text: "32".tr,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextBodyAuth(
                text: "33 ".tr,
              ),
               const  Spacer(),
               Container(
                width: double.infinity,
                 child: CustomButtonAuth(text: "35".tr, onPressed: () {
                  controller.goToPageLogin(); 
                               }),
               ),

               const SizedBox(height: 30,)
              
          ],
        ),
      ),
    );
  }
}