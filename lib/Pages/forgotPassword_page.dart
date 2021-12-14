import 'package:flutter/material.dart';

import '../constants.dart';
import '../utilities/roundedinput_field.dart';
import 'login_page.dart';

class ForgotPassword extends StatelessWidget {
  static String id = 'ForgotPassword_Page';

  const ForgotPassword({Key? key}) : super(key: key);

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
                  image: AssetImage('images/undraw_elements_cipa.png'),
                  colorFilter:
                      ColorFilter.mode(kInactiveColor, BlendMode.darken)),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 135,
                  left: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: size.height * 0.01),
                      RoundedInputField(
                        c1: Colors.white70,
                        h1: 45,
                        icon: Icons.phone,
                        hintText: "Phone",
                        onChanged: (value) {},
                      ),
                      SizedBox(height: size.height * 0.01),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5.0),
                        width: size.width * 0.3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(29),
                          child: FlatButton(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            color: kDarkssn,
                            onPressed: () {
                              Navigator.pushNamed(context, LoginPage.id);
                            },
                            child: const Text(
                              'GET OTP',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.01)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
