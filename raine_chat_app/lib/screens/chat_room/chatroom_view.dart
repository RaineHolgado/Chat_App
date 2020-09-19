import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:raine_chat_app/common/ui_helpers.dart';
import 'package:raine_chat_app/screens/chat_room/chat_input_widget.dart';
import 'package:raine_chat_app/screens/chat_room/chat_message_widget.dart';
import 'package:raine_chat_app/screens/signup_view.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:stacked/stacked.dart';

import 'chatroom_viewmodel.dart';

class ChatRoomView extends StatefulWidget {
  @override
  _ChatRoomViewState createState() => _ChatRoomViewState();
}

class _ChatRoomViewState extends State<ChatRoomView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatRoomViewModel>.reactive(
      viewModelBuilder: () => ChatRoomViewModel(),
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
                actions: [
                  Container(
                    height: 55,
                    width: 130,
                    margin: EdgeInsets.only(right: 20),
                    child: FlatButton(
                      color: Color(0xFF666666),
                      onPressed: () {
                        model.logout();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SignupView()),
                        );
                      },
                      child: Text(
                        "Log out",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          letterSpacing: 2,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            spacedDivider,
            verticalSpaceMedium,
            Flexible(
              child: StreamBuilder(
                stream: model.messageStream(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error}"),
                    );
                  }
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                      break;
                    default:
                      List<DocumentSnapshot> documents = snapshot.data.docs;
                      return Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              reverse: true,
                              itemCount: documents.length,
                              itemBuilder: (context, index) {
                                return ChatWidget(
                                  message: documents[index].data()["message"],
                                  name: documents[index].data()["name"],
                                  isSendByMe: documents[index].data()["name"] ==
                                      model.authenticationService.user.username,
                                );
                              },
                            ),
                          ),
                        ],
                      );
                  }
                },
              ),
            ),
            spacedDivider,
            ChatInputWidget(
              onSubmitted: (val) {
                model.messageSend(message: val);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
