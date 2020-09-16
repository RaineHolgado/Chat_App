import 'package:flutter/material.dart';
import 'package:raine_chat_app/common/input_field.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputField(
                controller: _usernameController,
                hintText: "Username",
                validator: (value) {
                  Pattern pattern = r'^[a-zA-Z]+$';
                  RegExp regex = new RegExp(pattern);
                  if (!value.isNotEmpty) {
                    return "Username is required";
                  } else if (!regex.hasMatch(value)) {
                    return "Username too short";
                  } else if (!(value.length > 6 && value.length < 8)) {
                    return "Username too short";
                  }
                },
              ),
              SizedBox(height: 20),
              InputField(
                controller: _passwordController,
                hintText: "Password",
              ),
              SizedBox(height: 20),
              FlatButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    print(_usernameController.text);
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
