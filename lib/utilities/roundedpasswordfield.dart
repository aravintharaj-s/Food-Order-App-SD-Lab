import 'package:flutter/material.dart';

import '../constants.dart';
import 'textfield_container.dart';

bool ispasshide = true;

class RoundedPasswordField extends StatefulWidget {
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
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      color: widget.c1,
      height: widget.h1,
      child: TextField(
        obscureText: ispasshide,
        onChanged: widget.onChanged,
        cursorColor: kSSNColor,
        decoration: InputDecoration(
          hintText: widget.hintText,
          icon: const Icon(
            Icons.lock,
            color: kSSNColor,
          ),
          suffixIcon: InkWell(
            onTap: _togglepass,
            child: const Icon(
              Icons.visibility,
              color: kSSNColor,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  void _togglepass() {
    setState(() {
      ispasshide = !ispasshide;
    });
  }
}
