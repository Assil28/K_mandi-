import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:k_mandi/controller/forgetpassword/forgetpassword_controller.dart';
import 'package:k_mandi/controller/auth/signup_controller.dart';
import 'package:k_mandi/core/class/handlingdataview.dart';
import 'package:k_mandi/core/class/statusrequest.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/core/functions/validinput.dart';
import 'package:k_mandi/view/widget/auth/custombuttonauth.dart';
import 'package:k_mandi/view/widget/auth/customtextbodyauth.dart';
import 'package:k_mandi/view/widget/auth/customtextformauth.dart';
import 'package:k_mandi/view/widget/auth/customtexttitleauth.dart';
import 'package:k_mandi/view/widget/auth/logoauth.dart';
import 'package:k_mandi/view/widget/auth/textsignup.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text("8".tr,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: AppColor.grey,
                  )),
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
            builder: (controller) =>
                HandlingDataRequest(statusRequest: controller.statusRequest, widget: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        child: Form(
                          key: controller.formstate,
                          child: ListView(
                            children: [
                              CustomTextTitleAuth(
                                text: "18".tr,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextBodyAuth(
                                text: "22".tr,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              CustomTextFormAuth(
                                  isNumber: false,
                                  valid: (val) {
                                    return validInput(val!, 5, 100, "email");
                                  },
                                  hinttext: "6".tr,
                                  labeltext: "4".tr,
                                  icondata: Icons.email_outlined,
                                  mycontroller: controller.email),
                              CustomButtonAuth(
                                  text: "19".tr,
                                  onPressed: () {
                                    controller.checkEmail();
                                  }),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ))));
  }
}
