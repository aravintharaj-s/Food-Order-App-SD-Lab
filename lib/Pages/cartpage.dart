import 'package:flutter/material.dart';
import 'package:sdlad_fos/Pages/invoice.dart';
import 'package:sdlad_fos/constants.dart';
import 'package:sdlad_fos/utilities/menuText.dart';
import 'package:sdlad_fos/utilities/navigationDrawerWidget.dart';
import 'package:sdlad_fos/utilities/sample_cart.dart';

class CartPage extends StatefulWidget {
  static String id = 'Cart_page';

  const CartPage({Key? key}) : super(key: key);
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  TimeOfDay _time = TimeOfDay.now();

  Future<Null> selectTime(BuildContext context) async {
    _time = (await showTimePicker(
      context: context,
      initialTime: _time,
    ))!;
  }

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                selectTime(context);
              },
              child: const Icon(
                Icons.alarm,
                color: kDarkssn,
                size: 25,
              ),
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: kInactiveColor,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        scrollDirection: Axis.vertical,
        children: const <Widget>[
          OrderCard(
              name: "Plain Dosa", img: "images/masala-dosa.png", price: 40),
          OrderCard(
              name: "Bread Omelette", img: "images/omelette.png", price: 40),
          OrderCard(
              name: "Gobi Manchurian",
              img: "images/tikka-masala (1).png",
              price: 80),
        ],
      ),
      bottomNavigationBar: _buildTotalContainer(),
    );
  }

  Widget _buildTotalContainer() {
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
            children: const <Widget>[
              Text(
                "Subtotal",
                style: TextStyle(
                    color: kInactiveColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "160.0",
                style: TextStyle(
                    color: kInactiveColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text(
                "Discount",
                style: TextStyle(
                    color: kInactiveColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "10.0",
                style: TextStyle(
                    color: kInactiveColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
                onTap: () {
                  selectTime(context);
                },
                child: Row(
                  children: const [
                    menuText(
                      text: "Select Time : ",
                    ),
                    Icon(
                      Icons.alarm,
                      color: kDarkssn,
                      size: 25,
                    ),
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
            children: const <Widget>[
              Text(
                "Cart Total",
                style: TextStyle(
                    color: kDarkssn,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "170",
                style: TextStyle(
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
              Navigator.pushNamed(context, InvoicePage.id);
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
