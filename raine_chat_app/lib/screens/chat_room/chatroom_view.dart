import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:raine_chat_app/screens/chat_room/chat_input_widget.dart';
import 'package:raine_chat_app/screens/chat_room/chat_message_widget.dart';
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
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              color: Color(0xFF647787),
              height: 1,
            ),
            SizedBox(height: 40),
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
            Container(
              color: Color(0xFF647787),
              height: 1,
            ),
            ChatInputWidget(
              onSubmitted: (val) {
                print(val);
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
