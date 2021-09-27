import 'package:flutter/material.dart';
import 'package:sdlad_fos/Pages/invoice.dart';
import 'package:sdlad_fos/utilities/navigationDrawerWidget.dart';
import 'package:sdlad_fos/utilities/menuText.dart';
import 'package:sdlad_fos/utilities/sample_cart.dart';
import 'package:sdlad_fos/constants.dart';

class CartPage extends StatefulWidget {
  static String id = 'Cart_page';
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  TimeOfDay _time = TimeOfDay.now();

  Future<Null> selecTime(BuildContext context) async {
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
        iconTheme: IconThemeData(color: kDarkssn),
        title: menuText(
          text: 'MY CART',
          size: 23,
          color: kDarkssn,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                selecTime(context);
              },
              child: Icon(
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
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        scrollDirection: Axis.vertical,
        children: <Widget>[
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
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
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
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
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
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Tax",
                style: TextStyle(
                    color: kInactiveColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "0.5",
                style: TextStyle(
                    color: kInactiveColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Divider(
            height: 2.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
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
          SizedBox(
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
              child: Center(
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
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
