import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/home_controller.dart';
import 'package:k_mandi/core/constant/color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());

    return Scaffold(
        appBar: AppBar(
            //title: Text('${controller.username}'),
            ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              //1ér partie
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(children: [
                    Expanded(
                        child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: "61".tr,
                          hintStyle: const TextStyle(fontSize: 18),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20)),
                          filled: true,
                          fillColor: Colors.grey[200]),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20)),
                      width: 60,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            size: 30,
                            color: Colors.grey,
                            Icons.notifications_active_outlined,
                          )),
                    )
                  ])),

              //2ém partie
              Container(
                margin:
                    const EdgeInsets.symmetric( vertical: 15),
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 150,
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                        title: Text(
                          "62".tr,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                        subtitle: Text("63".tr,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20)),
                      ),
                    ),
                    Positioned(
                      top: -20,
                      right: -20,
                      child: Container(
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                            color: AppColor.secondColor,
                            borderRadius: BorderRadius.circular(160)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
