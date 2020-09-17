import 'package:flutter/material.dart';
import 'package:raine_chat_app/screens/chat_room/chat_input_widget.dart';
import 'package:shape_of_view/shape_of_view.dart';

class ChatRoomView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              actions: [
                Container(
                  height: 55,
                  width: 130,
                  margin: EdgeInsets.only(right: 20),
                  child: FlatButton(
                    color: Color(0xFF666666),
                    onPressed: () {},
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
          Container(
            color: Color(0xFF647787),
            height: 1,
          ),
          SizedBox(height: 40),
          Flexible(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      _messageMay(context),
                      _messageRaine1(context),
                      _messageRaine2(context),
                      _messageMark(context),
                      _messageMark(context),
                      _messageMark(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xFF647787),
            height: 1,
          ),
          ChatInputWidget(
            onSubmitted: (val) {
              print(val);
              // message.message = val;
              // model.addMessageToDb(message);
            },
          ),
          
        ],
      ),
    );
  }

  Column _messageMay(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 25.0,
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: ShapeOfView(
                  elevation: 0,
                  shape: BubbleShape(
                      position: BubblePosition.Left,
                      arrowPositionPercent: 0.40,
                      borderRadius: 20,
                      arrowHeight: 10,
                      arrowWidth: 10),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.90,
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFF88E306),
                      // borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Hi Ken, I just sent the document to you on mail. Plz check it!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        letterSpacing: 2,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      "May",
                      style: TextStyle(
                        color: Color(0xFF647787),
                        fontSize: 24,
                        letterSpacing: 2,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Column _messageRaine1(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 25.0,
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: ShapeOfView(
                  elevation: 0,
                  shape: BubbleShape(
                      position: BubblePosition.Right,
                      arrowPositionPercent: 0.40,
                      borderRadius: 10,
                      arrowHeight: 10,
                      arrowWidth: 10),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.90,
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFF88E306),
                      // borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Thank you May! \nIt was great.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        letterSpacing: 2,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10, top: 10),
                    child: Text(
                      "You",
                      style: TextStyle(
                        color: Color(0xFF647787),
                        fontSize: 24,
                        letterSpacing: 2,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Column _messageRaine2(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 25.0,
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: ShapeOfView(
                  shape: BubbleShape(
                      position: BubblePosition.Right,
                      arrowPositionPercent: 0.40,
                      borderRadius: 10,
                      arrowHeight: 10,
                      arrowWidth: 10),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 3 / 4,
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFF88E306),
                      // borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "I just checked it. \nThanks",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        letterSpacing: 2,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10, top: 10),
                    child: Text(
                      "You",
                      style: TextStyle(
                        color: Color(0xFF647787),
                        fontSize: 24,
                        letterSpacing: 2,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Column _messageMark(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 25.0,
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: ShapeOfView(
                  shape: BubbleShape(
                      position: BubblePosition.Left,
                      arrowPositionPercent: 0.40,
                      borderRadius: 10,
                      arrowHeight: 10,
                      arrowWidth: 10),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 3 / 4,
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFF88E306),
                      // borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Hi guys, what's up?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        letterSpacing: 2,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      "Mark",
                      style: TextStyle(
                        color: Color(0xFF647787),
                        fontSize: 24,
                        letterSpacing: 2,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _ChatWidget extends StatelessWidget {
  final String name;
  final String message;
  final bool isSendByMe;

  const _ChatWidget({Key key, this.name, this.message, this.isSendByMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 6.0,
          ),
          child: isSendByMe
              ? Column(
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      child: ShapeOfView(
                        shape: BubbleShape(
                            position: BubblePosition.Right,
                            arrowPositionPercent: 0.85,
                            borderRadius: 20,
                            arrowHeight: 10,
                            arrowWidth: 10),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 3 / 4,
                          ),
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: Color(0xFF88E306),
                            // borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "$message",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              letterSpacing: 2,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 12),
                          child: Text(
                            "You",
                            style: TextStyle(
                              color: Color(0xFF647787),
                              fontSize: 24,
                              letterSpacing: 2,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              : Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: ShapeOfView(
                        shape: BubbleShape(
                            position: BubblePosition.Left,
                            arrowPositionPercent: 0.85,
                            borderRadius: 10,
                            arrowHeight: 10,
                            arrowWidth: 10),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 3 / 4,
                          ),
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: Color(0xFF88E306),
                            // borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "$message",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              letterSpacing: 2,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 12),
                          child: Text(
                            "$name",
                            style: TextStyle(
                              color: Color(0xFF647787),
                              fontSize: 24,
                              letterSpacing: 2,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
        ),
      ],
    );
  }
}
