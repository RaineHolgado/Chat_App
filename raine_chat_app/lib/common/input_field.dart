import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextInputFormatter formatter;
  final FocusNode fieldFocusNode;
  final FocusNode nextFocusNode;
  final Function enterPressed;
  final Function(String) onChanged;
  final Function(String) validator;

  const InputField(
      {Key key,
      this.hintText,
      this.controller,
      this.textInputType = TextInputType.text,
      this.textInputAction = TextInputAction.next,
      this.formatter,
      this.fieldFocusNode,
      this.nextFocusNode,
      this.enterPressed,
      this.onChanged,
      this.validator})
      : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextFormField(
        controller: widget.controller,
        cursorColor: Color(0xFF647787),
        style: TextStyle(
          color: Color(0xFF647787),
          fontSize: 30,
          letterSpacing: 2,
          fontWeight: FontWeight.normal,
        ),
        keyboardType: widget.textInputType,
        textInputAction: widget.textInputAction,
        onChanged: widget.onChanged,
        inputFormatters: widget.formatter != null ? [widget.formatter] : null,
        onEditingComplete: () {
          if (widget.enterPressed != null) {
            FocusScope.of(context).requestFocus(FocusNode());
            widget.enterPressed();
          }
        },
        onFieldSubmitted: (value) {
          if (widget.nextFocusNode != null) {
            widget.nextFocusNode.requestFocus();
          }
        },
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
          hintText: widget.hintText,
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
        validator: widget.validator,
      ),
    );
  }
}
