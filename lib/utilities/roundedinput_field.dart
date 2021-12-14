import 'package:flutter/material.dart';

import '../constants.dart';
import 'textfield_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final double h1;
  final Color c1;
  const RoundedInputField({
    required this.hintText,
    required this.icon,
    required this.onChanged,
    required this.c1,
    required this.h1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      color: c1,
      height: h1,
      child: TextField(
        onChanged: onChanged,
        cursorColor: kDarkssn,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kSSNColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
