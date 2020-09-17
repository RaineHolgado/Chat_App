import 'package:flutter/material.dart';

class UnderLineButton extends StatelessWidget {
  final String label;
  final Function onTap;

  const UnderLineButton({Key key, this.label, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: Color(0xFF647787),
          width: 2.0,
        ))),
        child: Text(
          label,
          style: TextStyle(
            color: Color(0xFF647787),
            fontSize: 24,
            letterSpacing: 2,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
