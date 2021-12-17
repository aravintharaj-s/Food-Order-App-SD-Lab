import 'package:flutter/material.dart';
import 'package:sdlad_fos/Pages/menupage.dart';
import 'package:sdlad_fos/constants.dart';
import '../Pages/invoice.dart';

class OrderCard extends StatefulWidget {
  final String name;
  final String img;
  final int price;
  const OrderCard({required this.name, required this.img, required this.price});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

int selected = 0;

class _OrderCardState extends State<OrderCard> {
  int _counter = 1;

  void _incrementCount() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCount() {
    if (_counter > 0) setState(() => _counter--);
  }

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
              width: 42.0,
              height: 69.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Column(
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          _incrementCount();
                        },
                        child: const Icon(Icons.keyboard_arrow_up,
                            size: 20, color: kDarkssn)),
                    Text(
                      '$_counter',
                      style: TextStyle(fontSize: 15.0, color: kDarkssn),
                    ),
                    InkWell(
                      onTap: () {
                        _decrementCount();
                      },
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
                    image: AssetImage(widget.img), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(35.0),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.name,
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5.0),
                Text(
                  "${widget.price * _counter}",
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
