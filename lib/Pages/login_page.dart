import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdlad_fos/Pages/menupage.dart';
import 'package:sdlad_fos/Pages/signup_page.dart';
import 'package:sdlad_fos/utilities/roundedbutton.dart';
import 'package:sdlad_fos/utilities/roundedinput_field.dart';
import 'package:sdlad_fos/utilities/roundedpasswordfield.dart';
import 'signup_page.dart';
import 'forgotPassword_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants.dart';
import 'package:sdlad_fos/fade_animation.dart';

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
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              child: FadeAnimation(
                2,
                Container(
                  child: Image.asset('images/undraw_breakfast.png'),
                ),
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
                      UserCredential user = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _email, password: _password);
                      if (user != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return Login_Successfull();
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
                      Text(
                        "Don't have an account ?",
                        style: TextStyle(color: kDarkssn),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Signup.id);
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: kDarkssn, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ForgotPassword.id);
                    },
                    child: Text(
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
                Container(
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
}

class Login_Successfull extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MenuPage();
  }
}
