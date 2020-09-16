import 'package:flutter/material.dart';
import 'package:raine_chat_app/common/input_field.dart';
import 'package:raine_chat_app/models/user.dart';
import 'package:raine_chat_app/services/authentication_services.dart';

class SignupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    User _user = new User();

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Chat app", ),
                InputField(
                  controller: _usernameController,
                  hintText: "Username",
                  // validator: (value) {
                  //   Pattern pattern = r'^[a-zA-Z]+$';
                  //   RegExp regex = new RegExp(pattern);
                  //   if (!value.isNotEmpty) {
                  //     return "Username is required";
                  //   } else if (!regex.hasMatch(value)) {
                  //     return "Username too short";
                  //   } else if (!(value.length > 6 && value.length < 8)) {
                  //     return "Username too short";
                  //   }
                  // },
                ),
                SizedBox(height: 20),
                InputField(
                  controller: _passwordController,
                  hintText: "password",
                ),
                SizedBox(height: 15),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: FlatButton(
                    color: Color.fromARGB(255, 155, 227, 39),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        _user.username = _usernameController.text;
                        _user.password = _passwordController.text;
                        authenticationService.signupUser(user: _user);
                      }
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w900),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(
                    bottom: 2, // space between underline and text
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.black, // Text colour here
                    width: 1.0, // Underline width
                  ))),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 19,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
