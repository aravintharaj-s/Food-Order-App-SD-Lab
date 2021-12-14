import 'package:flutter/material.dart';

import '../fade_animation.dart';

class Signup_Background extends StatelessWidget {
  const Signup_Background({required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: FadeAnimation(
              2,
              Image.asset('images/undraw_profile.png'),
            ),
            width: size.width,
            height: size.height * 0.25,
          ),
          child,
          Positioned(
            bottom: 0,
            child: FadeAnimation(
              2,
              Image.asset('images/petunia_string.JPG'),
            ),
            width: size.width,
            height: size.height * 0.25,
          ),
        ],
      ),
    );
  }
}
