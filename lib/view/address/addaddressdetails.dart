import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/address/addaddressdetails_controller.dart';
import 'package:k_mandi/core/class/handlingdataview.dart';
import 'package:k_mandi/core/shared/custombutton.dart';
import 'package:k_mandi/view/widget/auth/customtextformauth.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressDetailsController controller =
        Get.put(AddAddressDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('add details address'),
      ),
      body: Container(
          padding:const EdgeInsets.all(15),
          child: GetBuilder<AddAddressDetailsController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  CustomTextFormAuth(
                      hinttext: "city",
                      labeltext: "city",
                      icondata: Icons.location_city,
                      mycontroller: controller.city!,
                      valid: (val) {},
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: "street",
                      labeltext: "street",
                      icondata: Icons.streetview,
                      mycontroller: controller.street!,
                      valid: (val) {},
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: "name",
                      labeltext: "name",
                      icondata: Icons.near_me,
                      mycontroller: controller.name!,
                      valid: (val) {},
                      isNumber: false),
                  CustomButton(
                    text: "Add",
                    onPressed: () {
                      controller.addAddress() ; 
                    },
                  )
                ])),
          )),
    );
  }
}