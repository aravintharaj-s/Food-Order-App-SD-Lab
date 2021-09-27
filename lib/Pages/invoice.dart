import 'package:flutter/material.dart';
import 'package:sdlad_fos/constants.dart';
import 'package:sdlad_fos/utilities/menuText.dart';
import 'package:sdlad_fos/Pages/menupage.dart';

class InvoicePage extends StatelessWidget {
  static String id = 'Invoice_page';
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      children: [invoiceHeader(), invoiceBody(context)],
    ));
  }

  Widget invoiceHeader() {
    return Container(
      width: double.infinity,
      height: 265,
      color: kInactiveColor,
      padding: EdgeInsets.only(top: 20, left: 40, right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              menuText(text: "INVOICE", size: 40),
              SizedBox(
                height: 10,
              ),
              menuText(text: "Order ID : #20071203", size: 20),
              SizedBox(
                height: 10,
              ),
              // TODO: form get actual date and format it accondingly
              menuText(text: "Date : 25 SEPTEMBER 2021", size: 20),
              SizedBox(
                height: 10,
              ),
              menuText(text: "Pick it up by  : 01:30", size: 20),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
  return Container(
    height: 374,
    padding: EdgeInsets.symmetric(horizontal: 40),
    color: Colors.white,
    child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 23,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Items",
                  style: TextStyle(color: Colors.black, fontSize: 25)),
              FlatButton(
                color: kInactiveColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                child: Row(
                  children: [
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
          SizedBox(
            height: 30,
          ),
          Column(
            children: List.generate(
              CartFoodList.length,
              (index) => CartFoodCard(
                CartFoodList[index]['imagePath'],
                CartFoodList[index]['name'],
                CartFoodList[index]['price'],
              ),
            ),
          ),
          SizedBox(
            height: 34,
          ),
          invoiceTotal(160),
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
          Text(
            "TOTAL : ",
            style: TextStyle(
                color: kDarkssn, fontWeight: FontWeight.bold, fontSize: 23),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            "₹ $totalAmount",
            style: TextStyle(color: Colors.black, fontSize: 25),
          )
        ],
      )
    ],
  );
}

Widget CartFoodCard(var imagePath, var name, var price) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(right: 5, left: 5, top: 2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey)],
      color: Colors.white,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            //width: 300.0,
            child: Row(
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
                    child:
                        Image(fit: BoxFit.cover, image: AssetImage(imagePath)),
                  ),
                ),
                SizedBox(
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
