import 'package:flutter/material.dart';
import 'package:raine_chat_app/common/custom_flatbutton.dart';
import 'package:raine_chat_app/common/input_field.dart';
import 'package:raine_chat_app/common/loading.dart';
import 'package:raine_chat_app/common/terms_and_policy.dart';
import 'package:raine_chat_app/common/ui_helpers.dart';
import 'package:raine_chat_app/common/underlined_button.dart';
import 'package:raine_chat_app/screens/chat_room/chatroom_view.dart';
import 'package:raine_chat_app/screens/login_viewmodel.dart';
import 'package:raine_chat_app/screens/signup_view.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
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
                      model.isInvalidLogin ? _ErrorLoginWidget() : Container(),
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
                      model.isInvalidLogin ? _ErrorLoginWidget() : Container(),
                      verticalSpaceMedium,
                      model.isBusy
                          ? Loading()
                          : CustomFlatButton(
                              label: "Login",
                              color: Color(0xFF88E306),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  bool result = await model.login(
                                    username: _usernameController.text,
                                    password: _passwordController.text,
                                  );
                                  if (!result) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChatRoomView()),
                                    );
                                  }
                                } else {
                                  model.resetValue();
                                }
                              },
                            ),
                      verticalSpaceSmall,
                      UnderLineButton(
                        label: "SIgn up",
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupView()),
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

class _ErrorLoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 9),
      child: Text(
        "Value is incorrect",
        style: TextStyle(
          color: Color(0xFFcc3333),
          fontSize: 30,
          letterSpacing: 2,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
