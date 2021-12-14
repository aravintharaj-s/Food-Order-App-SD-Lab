import 'package:flutter/material.dart';
import 'package:sdlad_fos/constants.dart';
import 'package:sdlad_fos/utilities/menuText.dart';

class OrderCard extends StatefulWidget {
  final String name;
  final String img;
  final int price;
  const OrderCard({required this.name, required this.img, required this.price});
  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: kDarkssn, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              width: 45.0,
              height: 73.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Column(
                  children: <Widget>[
                    InkWell(
                        onTap: () {},
                        child: const Icon(Icons.keyboard_arrow_up,
                            color: kDarkssn)),
                    const Text(
                      "0",
                      style: TextStyle(fontSize: 18.0, color: kDarkssn),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.keyboard_arrow_down,
                        color: kDarkssn,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Container(
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage("images/masala-dosa.png"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(35.0),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 5.0,
                        offset: Offset(0.0, 2.0))
                  ]),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Plain Dosa",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5.0),
                const Text(
                  "140",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: kDarkssn,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5.0),
                SizedBox(
                  height: 25.0,
                  width: 120.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Row(
                        children: const <Widget>[
                          Text("Chicken",
                              style: TextStyle(
                                  color: kDarkssn,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: 5.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.cancel,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
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
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
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
                width: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(3.0),
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
            padding: const EdgeInsets.only(left: 18.0),
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
