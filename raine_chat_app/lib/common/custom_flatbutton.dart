import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final String label;
  final Color color;
  final Function onPressed;

  const CustomFlatButton({
    Key key,
    this.label,
    this.color,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      child: FlatButton(
        color: color,
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            letterSpacing: 3,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
