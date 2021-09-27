import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../fade_animation.dart';
import 'login_page.dart';
import '../constants.dart';

class Splash extends StatefulWidget {
  static String id = 'Splash_screen';
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _navigatetologin();
    super.initState();
  }

  _navigatetologin() async {
    await Future.delayed(Duration(milliseconds: 5000));
    Navigator.pushNamed(context, LoginPage.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: kInactiveColor),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: FadeAnimation(
                    2.5,
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'images/ssn2.jpg',
                                width: 125.0,
                                height: 180.0,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    " SSN ",
                    style: TextStyle(
                      letterSpacing: 0.2,
                      color: kDarkssn,
                      fontFamily: 'OpenSans',
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                  width: 250.0,
                  child: Divider(
                    color: kDarkssn,
                  ),
                ),
                Text(
                  'FOOD ORDERING APP',
                  style: TextStyle(
                    letterSpacing: 2.5,
                    fontSize: 20.0,
                    fontFamily: 'OpenSans',
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
