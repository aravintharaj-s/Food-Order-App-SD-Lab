import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sdlad_fos/Pages/forgotPassword_page.dart';
import 'package:sdlad_fos/Pages/invoice.dart';
import 'package:sdlad_fos/Pages/login_page.dart';
import 'package:sdlad_fos/Pages/menupage.dart';
import 'package:sdlad_fos/Pages/signup_page.dart';

import 'Pages/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
          LoginPage.id: (context) => const LoginPage(),
          Signup.id: (context) => Signup(),
          ForgotPassword.id: (context) => ForgotPassword(),
          MenuPage.id: (context) => const MenuPage(),
          //CartPage.id: (context) => const CartPage(),
          // InvoicePage.id: (context) =>  InvoicePage()
        });
  }
}
