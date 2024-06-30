import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/auth/successsignup_controller.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/view/widget/auth/custombuttonauth.dart';
import 'package:k_mandi/view/widget/auth/customtextbodyauth.dart';
import 'package:k_mandi/view/widget/auth/customtexttitleauth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
        SuccessSignUpControllerImp controller= Get.put(SuccessSignUpControllerImp() );

    return  Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text("34".tr,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
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
                text: "33".tr,
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