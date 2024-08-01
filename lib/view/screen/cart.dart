import 'package:flutter/material.dart';
import 'package:k_mandi/view/widget/cart/appbarcart.dart';
import 'package:k_mandi/view/widget/cart/customitemscartlist.dart';
import 'package:k_mandi/view/widget/cart/topcardcart.dart';
import 'package:k_mandi/view/widget/cart/ustom_bottom_navgationbar_cart.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavgationBarCart(
            price: "1200", shipping: "300", totalprice: "1500"),
        body: ListView(
          children: [
            TopAppbarCart(
              title: 'My Cart',
            ),
            const SizedBox(height: 10),
            TopCardCart(message: "You Have 2 Items in Your List"),
            Container(
              padding:const EdgeInsets.all(10),
              child: Column(
                children: [
                  CustomItemsCartList(
                      name: "Macbook M1", price: "1100.0 \$", count: "2"),
                  CustomItemsCartList(
                      name: "Macbook M2 Max", price: "2100.0 \$", count: "1"),
                ],
              ),
            )
          ],
        ));
  }
}
