import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/home_controller.dart';
import 'package:k_mandi/core/class/handlingdataview.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/linkapi.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());

    return Scaffold(
        appBar: AppBar(
            //title: Text('${controller.username}'),
            ),
        body: GetBuilder<HomeControllerImp>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
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
                          margin: const EdgeInsets.symmetric(vertical: 15),
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
                        ),

                        //3ém PArtie listView catgories
                        SizedBox(
                          height: 100,
                          // nafsha listView.builder juste fama separateur bin les elements
                          child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    width: 10,
                                  ),
                              itemCount: controller.categories.length,
                              //list view horizontal
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: AppColor.thirdColor,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      height: 70,
                                      width: 70,
                                      child: SvgPicture.network(
                                        "${LinkApi.imagesCategories}/${controller.categories[index]['categories_image']}",
                                        color: AppColor.secondColor,
                                      ),
                                    ),
                                    Text(
                                      "${controller.categories[index]['categories_name']}",
                                      style: const TextStyle(
                                          fontSize: 13, color: AppColor.black),
                                    ),
                                  ],
                                );
                              }),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "64".tr,
                          style: const TextStyle(
                            fontSize: 20,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                              itemCount: controller.items.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Image.network(
                                        "${LinkApi.imagesItems}/${controller.items[index]['items_images']}",
                                        height: 100,
                                        width: 150,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color:
                                              AppColor.black.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: 120,
                                      width: 200,
                                    ),
                                     Positioned(
                                        left: 10,
                                        child: Text(
                                          "${controller.items[index]['items_name']}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ))
                                  ],
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                )));
  }
}
