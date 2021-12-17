import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sdlad_fos/Pages/menupage.dart';
import 'package:sdlad_fos/constants.dart';
import 'package:sdlad_fos/utilities/menuText.dart';
import 'package:sdlad_fos/Pages/cartpage.dart';

class InvoicePage extends StatefulWidget {
  static String id = 'Invoice_page';
  final String selected_time;
  const InvoicePage({Key? key, required this.selected_time}) : super(key: key);

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  @override
  Widget build(BuildContext context) {
    int total = 0;
    for (int i = 0; i < cartItems.length; i++) {
      total = total + cartItems[i]['price'] as int;
    }
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 265,
            color: kInactiveColor,
            padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    menuText(text: "INVOICE", size: 30),
                    SizedBox(
                      height: 7,
                    ),
                    menuText(text: "Order ID : #20071203", size: 15),
                    SizedBox(
                      height: 10,
                    ),
                    // TODO: form get actual date and format it accondingly
                    menuText(text: "Date : 17 DECEMBER 2021", size: 15),
                    SizedBox(
                      height: 8,
                    ),
                    menuText(
                        text: "Pick it up by  :  $selected_time", size: 15),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.receipt_long_outlined,
                          size: 60,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 23,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Items",
                          style: TextStyle(color: Colors.black, fontSize: 25)),
                      FlatButton(
                        color: kInactiveColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Row(
                          children: const [
                            Icon(Icons.chevron_left),
                            Text("Back to Menu"),
                          ],
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, MenuPage.id);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: List.generate(
                      cartItems.length,
                      (index) => CartFoodCard(
                        cartItems[index]['imagePath'],
                        cartItems[index]['name'],
                        cartItems[index]['price'],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  invoiceTotal(total),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  Widget invoiceHeader() {
    return Container(
      width: double.infinity,
      height: 265,
      color: kInactiveColor,
      padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              menuText(text: "INVOICE", size: 30),
              SizedBox(
                height: 7,
              ),
              menuText(text: "Order ID : #20071203", size: 15),
              SizedBox(
                height: 10,
              ),
              // TODO: form get actual date and format it accondingly
              menuText(text: "Date : 17 DECEMBER 2021", size: 15),
              SizedBox(
                height: 8,
              ),
              menuText(text: "Pick it up by  :  $selected_time", size: 15),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    Icons.receipt_long_outlined,
                    size: 60,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget invoiceBody(context) {
  int total = 0;
  for (int i = 0; i < cartItems.length; i++) {
    total = total + cartItems[i]['price'] as int;
  }
  return Container(
    height: 374,
    padding: const EdgeInsets.symmetric(horizontal: 40),
    color: Colors.white,
    child: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 23,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Items",
                  style: TextStyle(color: Colors.black, fontSize: 25)),
              FlatButton(
                color: kInactiveColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                child: Row(
                  children: const [
                    Icon(Icons.chevron_left),
                    Text("Back to Menu"),
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, MenuPage.id);
                },
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: List.generate(
              cartItems.length,
              (index) => CartFoodCard(
                cartItems[index]['imagePath'],
                cartItems[index]['name'],
                cartItems[index]['price'],
              ),
            ),
          ),
          const SizedBox(
            height: 34,
          ),
          invoiceTotal(total),
        ],
      ),
    ),
  );
}

Row invoiceTotal(int totalAmount) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Row(
        children: [
          const Text(
            "TOTAL : ",
            style: TextStyle(
                color: kDarkssn, fontWeight: FontWeight.bold, fontSize: 23),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            "₹ $totalAmount",
            style: const TextStyle(color: Colors.black, fontSize: 25),
          )
        ],
      )
    ],
  );
}

Widget CartFoodCard(var imagePath, var name, var price) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(right: 5, left: 5, top: 2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [BoxShadow(blurRadius: 5, color: Colors.grey)],
      color: Colors.white,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 75.0,
                width: 75.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: kInactiveColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(fit: BoxFit.cover, image: AssetImage(imagePath)),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: menuText(
                        text: name,
                        fontWeight: FontWeight.w600,
                        size: 17.0,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: menuText(
              text: "₹ $price",
              color: kDarkssn,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}
