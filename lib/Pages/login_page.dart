import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdlad_fos/Pages/menupage.dart';
import 'package:sdlad_fos/Pages/signup_page.dart';
import 'package:sdlad_fos/fade_animation.dart';
import 'package:sdlad_fos/utilities/roundedbutton.dart';
import 'package:sdlad_fos/utilities/roundedinput_field.dart';
import 'package:sdlad_fos/utilities/roundedpasswordfield.dart';

import '../constants.dart';
import 'forgotPassword_page.dart';
import 'signup_page.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  static String id = 'Login_page';
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              child: FadeAnimation(
                2,
                Image.asset('images/undraw_breakfast.png'),
              ),
              width: size.width,
              height: size.height * 0.25,
            ),
            Positioned(
              top: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height * 0.03),
                  RoundedInputField(
                    c1: kInactiveColor,
                    h1: 50,
                    icon: Icons.person,
                    hintText: "Your Email",
                    onChanged: (value) {
                      _email = value;
                    },
                  ),
                  RoundedPasswordField(
                    c1: kInactiveColor,
                    h1: 50,
                    hintText: "Password",
                    onChanged: (value) {
                      _password = value;
                    },
                  ),
                  RoundedButton(
                    text: "LOGIN",
                    press: () async {
                      show(context);
                      UserCredential user = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _email, password: _password);

                      if (user != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const Login_Successfull();
                          }),
                        );
                      } else {
                        print('user does not exist');
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account ?",
                        style: TextStyle(color: kDarkssn),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Signup.id);
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              color: kDarkssn, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ForgotPassword.id);
                    },
                    child: const Text(
                      "Forgot Password",
                      style: TextStyle(
                          color: kDarkssn,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: FadeAnimation(
                2,
                SizedBox(
                  child: Image.asset('images/login.png'),
                  width: size.width,
                  height: size.height * 0.365,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void show(context) {
    if (_email.toString().isEmpty && _password.toString().isEmpty) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: const Text('Both fields are empty'),
          duration: const Duration(seconds: 5),
        ),
      );
    }
    if (_email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email is empty'),
          duration: Duration(seconds: 5),
        ),
      );
    } else if (_password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password is empty'),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }
}

class Login_Successfull extends StatelessWidget {
  const Login_Successfull({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MenuPage();
  }
}
