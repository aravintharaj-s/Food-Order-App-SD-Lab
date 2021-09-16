import 'package:flutter/material.dart';
import '../constants.dart';
import 'textfield_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final double h1;
  final Color c1;
  const RoundedPasswordField({
    required this.onChanged,
    required this.hintText,
    required this.c1,
    required this.h1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      color: c1,
      height: h1,
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kSSNColor,
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(
            Icons.lock,
            color: kSSNColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kSSNColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
