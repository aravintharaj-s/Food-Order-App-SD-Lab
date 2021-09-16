import 'package:flutter/material.dart';

class menuText extends StatelessWidget {
  final String text;
  final double height;
  final FontWeight fontWeight;
  final Color color;
  final double size;
  const menuText(
      {this.size = 20,
      this.height = 1.3,
      this.fontWeight = FontWeight.w400,
      this.color = Colors.black,
      this.text = ''});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
          fontFamily: 'OpenSans',
          height: height),
    );
  }
}
