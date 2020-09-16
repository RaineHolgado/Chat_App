import 'package:flutter/material.dart';
import 'package:raine_chat_app/common/input_field.dart';
import 'package:raine_chat_app/models/message.dart';
import 'package:raine_chat_app/models/user.dart';
import 'package:raine_chat_app/services/authentication_services.dart';

class ChatRoomView extends StatefulWidget {
  @override
  _ChatRoomViewState createState() => _ChatRoomViewState();
}

class _ChatRoomViewState extends State<ChatRoomView> {
  // TextEditingController _messageController = TextEditingController();

  // Message _message = new Message();
  Widget chatMessageList() {
    return StreamBuilder(
        stream: chatMessagesStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            print("no data");
            // print(snapshot.data);
          } else {
            print(snapshot.data.length);
            // for (var item in snapshot.data) {
            //   print(item);
            // }

            return ListView(
                children: snapshot.data.map((data) {
                  print(data);
                }));

            // return ListView.builder(
            //     itemCount: snapshot.data.length,
            //     itemBuilder: (context, index) {
            //       // print(Message.fromMap(snapshot.data[index]).message);
            //       print(snapshot.data[index].data);

            //       return Text(snapshot.data[index]["message"]);
            //       return Text("1");
            //     });
          }
          // print(snapshot.data);
          // return ListView.builder(
          //   itemCount: snapshot.data.length,
          //   itemBuilder: (context, index) {
          // Message messages = Message.fromMap(snapshot.data);
          // print(messages.message);

          // return Text("snapshot.data");
          // return MessageTile(
          //     snapshot.data.documents[index].data["message"]);
          //   },
          // );
        });
  }

  Stream chatMessagesStream;

  @override
  void initState() {
    super.initState();
    chatMessagesStream = authenticationService.getConversationMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: chatMessageList()),
      // body: Container(
      //   padding: EdgeInsets.symmetric(horizontal: 10),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       SizedBox(height: 20),

      //       // InputField(
      //       //   controller: _messageController,
      //       //   hintText: "Password",
      //       // ),
      //       // SizedBox(height: 20),
      //       // FlatButton(
      //       //   onPressed: () {
      //       //     _message.message = _messageController.text;
      //       //     authenticationService.messageRoom(message: _message);
      //       //   },
      //       //   child: Text("Submit"),
      //       // ),
      //     ],
      //   ),
      // ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String message;

  MessageTile(this.message);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(message),
    );
  }
}
