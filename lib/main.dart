import 'package:flutter/material.dart';
import 'package:sdlad_fos/Pages/cartpage.dart';
import 'package:sdlad_fos/Pages/forgotPassword_page.dart';
import 'package:sdlad_fos/Pages/login_page.dart';
import 'package:sdlad_fos/Pages/menupage.dart';
import 'package:sdlad_fos/Pages/signup_page.dart';
import 'Pages/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Splash.id,
        routes: {
          Splash.id: (context) => Splash(),
          LoginPage.id: (context) => LoginPage(),
          Signup.id: (context) => Signup(),
          ForgotPassword.id: (context) => ForgotPassword(),
          MenuPage.id: (context) => MenuPage(),
          CartPage.id: (context) => CartPage(),
        });
  }
}
