import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text('${controller.username}'),
      ),
      body: Container(
        child: Center(child: Text('Home')),
      ),
    );
  }
}
 