import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Function(String) onChanged;
  final Function(String) validator;

  const InputField({
    Key key,
    this.hintText,
    this.controller,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        cursorColor: Color(0xFF647787),
        style: TextStyle(
          color: Color(0xFF647787),
          fontSize: 30,
          letterSpacing: 2,
          fontWeight: FontWeight.normal,
        ),
        keyboardType: textInputType,
        textInputAction: textInputAction,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFF5F8FA),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xFF647787),
            fontSize: 30,
            letterSpacing: 2,
            fontWeight: FontWeight.normal,
          ),
          errorStyle: TextStyle(
            color: Color(0xFFcc3333),
            fontSize: 30,
            letterSpacing: 2,
            fontWeight: FontWeight.normal,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        ),
        validator: validator,
      ),
    );
  }
}
