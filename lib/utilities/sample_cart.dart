import 'package:flutter/material.dart';
import 'package:sdlad_fos/constants.dart';

class OrderCard extends StatelessWidget {
  final String name;
  final String img;
  final int price;
  const OrderCard({required this.name, required this.img, required this.price});

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
                      "1",
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
                  image: DecorationImage(
                      image: AssetImage(img), fit: BoxFit.cover),
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
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5.0),
                Text(
                  "$price",
                  style: const TextStyle(
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
                          Icon(Icons.star, color: Colors.orange, size: 17),
                          Icon(Icons.star, color: Colors.orange, size: 17),
                          Icon(Icons.star, color: Colors.orange, size: 17),
                          Icon(Icons.star, color: Colors.orange, size: 17),
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
