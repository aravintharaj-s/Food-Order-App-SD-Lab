import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sdlad_fos/Pages/login_page.dart';
import 'package:sdlad_fos/constants.dart';
import 'package:sdlad_fos/fade_animation.dart';

import '../utilities/roundedbutton.dart';
import '../utilities/roundedinput_field.dart';
import '../utilities/roundedpasswordfield.dart';

class Signup extends StatelessWidget {
  static String id = 'Signup_page';

  late String _email, _password, _fullName, _mobileNumber;

  Signup({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
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
                    Image.asset('images/pp.png'),
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
                        onChanged: (value) {
                          _fullName = value;
                        },
                      ),
                      SizedBox(height: size.height * 0.01),
                      RoundedInputField(
                        c1: Colors.white70,
                        h1: 45,
                        icon: Icons.mail,
                        hintText: "Email",
                        onChanged: (value) {
                          _email = value;
                        },
                      ),
                      SizedBox(height: size.height * 0.01),
                      RoundedInputField(
                        c1: Colors.white70,
                        h1: 45,
                        icon: Icons.phone,
                        hintText: "Phone",
                        onChanged: (value) {
                          _mobileNumber = value;
                        },
                      ),
                      SizedBox(height: size.height * 0.01),
                      RoundedPasswordField(
                        c1: Colors.white70,
                        h1: 45,
                        hintText: "Password",
                        onChanged: (value) {
                          _password = value;
                        },
                      ),
                      SizedBox(height: size.height * 0.01),
                      RoundedPasswordField(
                        c1: Colors.white70,
                        h1: 45,
                        hintText: "Re-enter Password",
                        onChanged: (value) {
                          _password = value;
                        },
                      ),
                      RoundedButton(
                        text: "SIGNUP",
                        press: () async {
                          UserCredential user = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: _email, password: _password);
                          if (user != null) {
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(_email)
                                .set({
                              'FullName': _fullName,
                              'MobileNumber': _mobileNumber,
                              'Email': _email,
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const LoginPage();
                              }),
                            );
                          } else {
                            print('user does not exist');
                          }
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
