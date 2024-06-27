import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/forgetpassword/forgetpassword_controller.dart';
import 'package:k_mandi/controller/forgetpassword/resetpassword_controller.dart';
import 'package:k_mandi/core/class/statusrequest.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/core/functions/validinput.dart';
import 'package:k_mandi/view/widget/auth/custombuttonauth.dart';
import 'package:k_mandi/view/widget/auth/customtextbodyauth.dart';
import 'package:k_mandi/view/widget/auth/customtextformauth.dart';
import 'package:k_mandi/view/widget/auth/customtexttitleauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
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
        body: GetBuilder<ResetPasswordControllerImp>(
            builder: (controller) =>
                controller.statusRequest == StatusRequest.loading
                    ? Center(
                        child: Text("60".tr),
                      )
                    : Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        child: Form(
                          key: controller.formstate,
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
                                  isNumber: false,
                                  valid: (val) {
                                    return validInput(val!, 5, 30, "password");
                                  },
                                  hinttext: "28".tr,
                                  labeltext: "5".tr,
                                  icondata: Icons.lock_outlined,
                                  mycontroller: controller.password),

                              CustomTextFormAuth(
                                  isNumber: false,
                                  valid: (val) {
                                    return validInput(val!, 5, 30, "password");
                                  },
                                  hinttext: "29".tr,
                                  labeltext: "5".tr,
                                  icondata: Icons.lock_outlined,
                                  mycontroller: controller.repassword),
                              CustomButtonAuth(
                                  text: "27".tr,
                                  onPressed: () {
                                    controller.resetPassword();
                                  }),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      )));
  }
}
