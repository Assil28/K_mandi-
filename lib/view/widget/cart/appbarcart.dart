import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopAppbarCart extends StatelessWidget {
  final String title ; 
  const TopAppbarCart({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          }, icon:const Icon(Icons.arrow_back)),
                    )),
                    Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      child: Text(
                       title,
                        style:const TextStyle(fontSize: 25),
                      ),
                    )),
                    const Spacer()
                  ],
                )) ; 
  }
}