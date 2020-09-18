import 'package:flutter/material.dart';
import 'package:raine_chat_app/common/custom_flatbutton.dart';
import 'package:raine_chat_app/common/ui_helpers.dart';
import 'package:raine_chat_app/screens/login_view.dart';
import 'package:raine_chat_app/screens/signup_view.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: fieldPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/chat_app_logo.png"),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 190.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Chat app",
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 50,
                          letterSpacing: 3,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpace(70),
            CustomFlatButton(
              label: "Sign up",
              color: Color(0xFF62A304),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupView()),
                );
              },
            ),
            verticalSpaceSmall,
            CustomFlatButton(
              label: "Login",
              color: Color(0xFF88E306),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginView()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
