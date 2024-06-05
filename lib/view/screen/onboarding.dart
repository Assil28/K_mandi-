import 'package:flutter/material.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/data/datasource/static/static.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: PageView.builder(
          itemCount: onBoardingList.length,
          itemBuilder: (context, i) => Column(
                children: [
                  Text(
                    onBoardingList[i].title!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Image.asset(onBoardingList[i].image!,width: 300,height: 250, fit: BoxFit.fill,),
                  const SizedBox(
                    height: 80,
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      onBoardingList[i].body!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          height: 2,
                          color: AppColor.grey,
                          fontWeight: FontWeight.bold,fontSize: 17,
                          ),
                    ),
                  ),
                ],
              )),
    ));
  }
}
