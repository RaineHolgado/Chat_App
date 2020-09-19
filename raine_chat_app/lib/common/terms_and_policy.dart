import 'package:flutter/material.dart';

class TermsAndPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "By signing up, you agree to the Terms of Service and Privacy Policy, including Cookie Use. Others will be able to find you by searching for your email address or phone number when provided.",
      style: TextStyle(
        color: Color(0xFF647787),
        fontSize: 24,
        letterSpacing: 2,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
