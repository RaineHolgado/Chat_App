import 'package:flutter/material.dart';
import 'package:raine_chat_app/common/custom_flatbutton.dart';
import 'package:raine_chat_app/common/input_field.dart';
import 'package:raine_chat_app/common/terms_and_policy.dart';
import 'package:raine_chat_app/common/underlined_button.dart';
import 'package:raine_chat_app/models/user.dart';
import 'package:raine_chat_app/screens/chat_room/chatroom_view.dart';
import 'package:raine_chat_app/screens/chatroom_view.dart';
import 'package:raine_chat_app/screens/login_view.dart';
import 'package:raine_chat_app/services/authentication_services.dart';

class SignupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    User _user = User();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                "Chat app",
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xFF647787),
              height: 1,
            ),
            SizedBox(height: 60),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputField(
                      controller: _usernameController,
                      hintText: "User name",
                      validator: (value) {
                        if (!value.isNotEmpty) {
                          return "Value is incorrect";
                        } else if (!(value.length > 8 && value.length < 17)) {
                          return "Value is incorrect";
                        }
                      },
                    ),
                    SizedBox(height: 40),
                    InputField(
                      controller: _passwordController,
                      hintText: "password",
                      validator: (value) {
                        if (!value.isNotEmpty) {
                          return "Value is incorrect";
                        } else if (!(value.length > 7 && value.length < 16)) {
                          return "Value is incorrect";
                        }
                      },
                    ),
                    SizedBox(height: 40),
                    CustomFlatButton(
                      label: "Sign up",
                      color: Color(0xFF88E306),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          print(_usernameController.text);
                          print(_passwordController.text);
                        authenticationService.signupUser(user: _user);

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatRoomView()),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    UnderLineButton(
                      label: "Login",
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginView()),
                        );
                      },
                    ),
                    SizedBox(height: 40),
                    TermsAndPolicy()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}