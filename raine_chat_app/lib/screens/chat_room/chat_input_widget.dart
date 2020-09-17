import 'package:flutter/material.dart';

class ChatInputWidget extends StatefulWidget {
  final Function(String) onSubmitted;

  const ChatInputWidget({Key key, this.onSubmitted}) : super(key: key);

  @override
  _ChatInputWidgetState createState() => _ChatInputWidgetState();
}

class _ChatInputWidgetState extends State<ChatInputWidget> {
  TextEditingController editingController = TextEditingController();
  FocusNode focusNode = FocusNode();

  void sendMessage(String message) {
    widget.onSubmitted(message);
    editingController.text = '';
    focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              child: TextField(
                cursorColor: Color(0xFF647787),
                style: TextStyle(
                  color: Color(0xFF647787),
                  fontSize: 30,
                  letterSpacing: 2,
                  fontWeight: FontWeight.normal,
                ),
                focusNode: focusNode,
                textInputAction: TextInputAction.send,
                controller: editingController,
                onSubmitted: sendMessage,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF5F8FA),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  hintText: "Start a new message",
                  hintStyle: TextStyle(
                    color: Color(0xFF647787),
                    fontSize: 30,
                    letterSpacing: 2,
                    fontWeight: FontWeight.normal,
                  ),
                  errorStyle: TextStyle(
                    color: Color(0xFFcc3333),
                    fontSize: 30,
                    letterSpacing: 2,
                    fontWeight: FontWeight.normal,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Container(
            height: 55,
            width: 100,
            margin: EdgeInsets.only(right: 4),
            child: FlatButton(
              color: Color(0xFF666666),
              onPressed: () {
                sendMessage(editingController.text);
              },
              child: Text(
                "Send",
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
    );
  }
}
