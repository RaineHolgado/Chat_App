import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: double.infinity,
              child: FlatButton(
                color: Color.fromARGB(255, 97, 176, 40),
                onPressed: () {},
                child: Text(
                  "Sign up",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w700),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 50,
              width: double.infinity,
              child: FlatButton(
                color: Color.fromARGB(255, 155, 227, 39),
                onPressed: () {},
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w700),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
