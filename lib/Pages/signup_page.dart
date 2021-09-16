import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sdlad_fos/constants.dart';
import 'package:sdlad_fos/fade_animation.dart';
import '../utilities/roundedbutton.dart';
import '../utilities/roundedpasswordfield.dart';
import '../utilities/roundedinput_field.dart';
import 'menupage.dart';

class Signup extends StatelessWidget {
  static String id = 'Signup_page';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: kInactiveColor,
              image: DecorationImage(
                  image: AssetImage('images/undraw_Appreciation_re_p6rl.png'),
                  colorFilter:
                      ColorFilter.mode(kInactiveColor, BlendMode.darken)),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  child: FadeAnimation(
                    1.5,
                    Container(
                      child: Image.asset('images/pp.png'),
                    ),
                  ),
                  width: size.width,
                  height: size.height * 0.25,
                ),
                Positioned(
                  top: 130,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: size.height * 0.1),
                      RoundedInputField(
                        c1: Colors.white70,
                        h1: 45,
                        icon: Icons.person,
                        hintText: "Name",
                        onChanged: (value) {},
                      ),
                      SizedBox(height: size.height * 0.01),
                      RoundedInputField(
                        c1: Colors.white70,
                        h1: 45,
                        icon: Icons.mail,
                        hintText: "Email",
                        onChanged: (value) {},
                      ),
                      SizedBox(height: size.height * 0.01),
                      RoundedInputField(
                        c1: Colors.white70,
                        h1: 45,
                        icon: Icons.phone,
                        hintText: "Phone",
                        onChanged: (value) {},
                      ),
                      SizedBox(height: size.height * 0.01),
                      RoundedPasswordField(
                        c1: Colors.white70,
                        h1: 45,
                        hintText: "Password",
                        onChanged: (value) {},
                      ),
                      SizedBox(height: size.height * 0.01),
                      RoundedPasswordField(
                        c1: Colors.white70,
                        h1: 45,
                        hintText: "Re-enter Password",
                        onChanged: (value) {},
                      ),
                      RoundedButton(
                        text: "SIGNUP",
                        press: () {
                          Navigator.pushNamed(context, MenuPage.id);
                        },
                      ),
                    ],
                  ),
                ),
                /* Positioned(
                  bottom: 0,
                  child: FadeAnimation(
                    2,
                    Container(
                      child: Image.asset('images/heart.png'),
                    ),
                  ),
                  width: size.width,
                  height: size.height,
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
