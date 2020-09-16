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

  const InputField({
    Key key,
    this.hintText,
    this.controller,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.formatter,
    this.fieldFocusNode,
    this.nextFocusNode,
    this.enterPressed,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextFormField(
        cursorColor: Colors.black54,
        cursorWidth: 1,
        controller: widget.controller,
        keyboardType: widget.textInputType,
        focusNode: widget.fieldFocusNode,
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
          fillColor: Colors.indigo[50],
          border:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                width: 0, 
                style: BorderStyle.none,
            ),
        ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            // fontSize: 18,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w700
          ),
          contentPadding: EdgeInsets.all(10),
        ),
        validator: widget.validator,
      ),
    );
  }
}
