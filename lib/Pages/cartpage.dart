import 'package:flutter/material.dart';
import 'package:sdlad_fos/utilities/menuText.dart';
import 'package:sdlad_fos/constants.dart';

import 'package:sdlad_fos/utilities/cart_item_card.dart';

class CartPage extends StatefulWidget {
  static String id = 'Cart_page';

  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kInactiveColor,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(right: 15.0),
          child: Icon(Icons.chevron_left, color: kDarkssn, size: 25),
        ),
        title: menuText(
          text: 'CART',
          size: 23,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        //centerTitle: true,
        backgroundColor: kInactiveColor,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            //Padding(
            // padding: const EdgeInsets.only(left: 16.0),
            //child:
            menuText(text: 'My Cart', fontWeight: FontWeight.w600, size: 25),
            SizedBox(
              height: 10,
            ),
            ListView(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              scrollDirection: Axis.vertical,
              children: [CartItem(), CartItem(), CartItem(), CartItem()],
            )
          ],
        ),
      ),
    );
  }
}
