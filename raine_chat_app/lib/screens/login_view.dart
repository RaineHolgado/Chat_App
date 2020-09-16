import 'package:flutter/material.dart';
import 'package:raine_chat_app/common/inputfield.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat app"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              InputField(),
            ],
          ),
        ),
      ),
    );
  }
}
