import 'package:flutter/material.dart';
import 'package:sdlad_fos/Pages/invoice.dart';
import 'package:sdlad_fos/Pages/menupage.dart';
import 'package:sdlad_fos/constants.dart';
import 'package:sdlad_fos/utilities/menuText.dart';
import 'package:sdlad_fos/utilities/navigationDrawerWidget.dart';
import 'package:sdlad_fos/utilities/sample_cart.dart';
import 'package:sdlad_fos/utilities/roundedinput_field.dart';

String selected_time = "";

class CartPage extends StatefulWidget {
  static String id = 'Cart_page';
  final List cartItems;
  const CartPage({Key? key, required this.cartItems}) : super(key: key);
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kInactiveColor,
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kDarkssn),
        title: const menuText(
          text: 'MY CART',
          size: 23,
          color: kDarkssn,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: kInactiveColor,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return OrderCard(
              name: cartItems[index]['name'],
              img: cartItems[index]['imagePath'],
              price: cartItems[index]['price']);
        },
      ),
      bottomNavigationBar: _buildTotalContainer(),
    );
  }

  Widget _buildTotalContainer() {
    int total = 0;
    for (int i = 0; i < cartItems.length; i++) {
      total = total + cartItems[i]['price'] as int;
    }
    return Container(
      height: 220.0,
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedInputField(
                  c1: Colors.white,
                  h1: 50,
                  icon: Icons.alarm,
                  hintText: "Enter Time",
                  onChanged: (value) {
                    selected_time = value;
                  },
                )
              ],
            )),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Divider(
            height: 2.0,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Cart Total",
                style: TextStyle(
                    color: kDarkssn,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "$total",
                style: const TextStyle(
                    color: kDarkssn,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          InvoicePage(selected_time: selected_time)));
            },
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: kDarkssn,
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: const Center(
                child: Text(
                  "Proceed To Checkout",
                  style: TextStyle(
                    color: kInactiveColor,
                    fontSize: 18.0,
                    backgroundColor: kDarkssn,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// ListView(
// padding: const EdgeInsets.symmetric(horizontal: 5.0),
// scrollDirection: Axis.vertical,
// children: const <Widget>[
// OrderCard(
// name: "Plain Dosa", img: "images/masala-dosa.png", price: 40),
// OrderCard(
// name: "Bread Omelette", img: "images/omelette.png", price: 40),
// OrderCard(
// name: "Gobi Manchurian",
// img: "images/tikka-masala (1).png",
// price: 80),
// ],
// )
