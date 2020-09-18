import 'package:flutter/material.dart';
import 'package:raine_chat_app/common/custom_flatbutton.dart';
import 'package:raine_chat_app/common/input_field.dart';
import 'package:raine_chat_app/common/terms_and_policy.dart';
import 'package:raine_chat_app/common/ui_helpers.dart';
import 'package:raine_chat_app/common/underlined_button.dart';
import 'package:raine_chat_app/screens/chat_room/chatroom_view.dart';
import 'package:raine_chat_app/screens/login_view.dart';
import 'package:raine_chat_app/screens/signup_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
      viewModelBuilder: () => SignupViewModel(),
      builder: (context, model, child) => Scaffold(
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
              spacedDivider,
              verticalSpaceLarge,
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
                          } else if (!(value.length >= 8 &&
                              value.length <= 16)) {
                            return "Value is incorrect";
                          }
                          return null;
                        },
                      ),
                      verticalSpaceMedium,
                      InputField(
                        controller: _passwordController,
                        hintText: "password",
                        validator: (value) {
                          if (!value.isNotEmpty) {
                            return "Value is incorrect";
                          } else if (!(value.length >= 8 &&
                              value.length <= 16)) {
                            return "Value is incorrect";
                          }
                          return null;
                        },
                      ),
                      verticalSpaceMedium,
                      model.isBusy
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : CustomFlatButton(
                              label: "Sign up",
                              color: Color(0xFF88E306),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  await model.signup(
                                    username: _usernameController.text,
                                    password: _passwordController.text,
                                  );
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChatRoomView()),
                                  );
                                } else {
                                  setState(() {
                                    _autoValidate = true;
                                  });
                                }
                              },
                            ),
                      verticalSpaceSmall,
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
                      verticalSpaceMedium,
                      TermsAndPolicy()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
