import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function(String) validator;

  const InputField({
    Key key,
    this.hintText,
    this.controller,
    this.validator,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: validator,
    );
  }
}
