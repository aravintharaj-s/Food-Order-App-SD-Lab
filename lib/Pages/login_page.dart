import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdlad_fos/Pages/menupage.dart';
import 'package:sdlad_fos/Pages/signup_page.dart';
import 'signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants.dart';


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
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/ssn2.jpg"),
                    alignment: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("SIGN IN",
                            style: TextStyle(
                              color: kDarkssn,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            )),
                        FlatButton(
                          color: Colors.black12,
                          textColor: Colors.white,
                          child: Text('Sign Up',
                              style: TextStyle(
                                color: kDarkssn,
                                fontWeight: FontWeight.bold,
                              )),
                          onPressed: ()
                          {
                            print('Pressed SignUP!');
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return Signup();
                              }),
                            );
                          },
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Icon(
                              Icons.alternate_email,
                              color: kDarkssn,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              onChanged: (value){
                                _email=value;
                              },
                              decoration: InputDecoration(
                                hintText: "Email Address",
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Icon(
                            Icons.lock,
                            color: kDarkssn,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            obscureText: true,
                            onChanged: (value){
                              _password=value;
                            },
                            decoration: InputDecoration(
                              hintText: "Password",
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      child: Container(
                        color: kDarkssn,
                        margin: EdgeInsets.only(top: 10.0),
                        width: double.infinity,
                        height: 80.0,
                        child: Center(
                          child: Text('LogIn',
                              style: TextStyle(
                                color: kInactiveColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              )),
                        ),
                      ),
                      onTap: ()async
                      {
                        UserCredential user= await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
                        if(user!=null)
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return Login_Successfull();
                              }),
                            );
                          }
                        else
                          {
                            print('user does not exist');
                          }
                      },
                    ),
                  ],
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