import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdlad_fos/fade_animation.dart';
import 'package:sdlad_fos/Pages/forgotPassword_page.dart';
import '../utilities/roundedinput_field.dart';
import '../utilities/roundedpasswordfield.dart';
import '../utilities/roundedbutton.dart';
import 'menupage.dart';
import '../constants.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  static String id = 'Login_page';
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    /* image: DecorationImage(
                        image: AssetImage(
                          'images/undraw_breakfast_psiw.png',
                        ),
                        fit: BoxFit.cover),*/
                    color: Colors.white),
              ),
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
                  children: [
                    SizedBox(height: size.height * 0.03),
                    RoundedInputField(
                      c1: kInactiveColor,
                      h1: 50,
                      icon: Icons.person,
                      hintText: "Your Email",
                      onChanged: (value) {},
                    ),
                    RoundedPasswordField(
                      c1: kInactiveColor,
                      h1: 50,
                      hintText: "Password",
                      onChanged: (value) {},
                    ),
                    RoundedButton(
                      text: "LOGIN",
                      press: () {
                        Navigator.pushNamed(context, MenuPage.id);
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
      ),
    );
  }
}
