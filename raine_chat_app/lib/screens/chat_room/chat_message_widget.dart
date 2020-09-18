import 'package:flutter/material.dart';
import 'package:shape_of_view/shape_of_view.dart';

class ChatWidget extends StatelessWidget {
  final String name;
  final String message;
  final bool isSendByMe;

  const ChatWidget({Key key, this.name, this.message, this.isSendByMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 20.0,
          ),
          child: isSendByMe
              ? Column(
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      child: ShapeOfView(
                        elevation: 0,
                        shape: BubbleShape(
                            position: BubblePosition.Right,
                            arrowPositionPercent: 0.40,
                            borderRadius: 20,
                            arrowHeight: 10,
                            arrowWidth: 10),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.85,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 20),
                          decoration: BoxDecoration(
                            color: Color(0xFF88E306),
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
                )
              : Column(
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
                            maxWidth: MediaQuery.of(context).size.width * 0.85,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 20),
                          decoration: BoxDecoration(
                            color: Color(0xFF88E306),
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
                          margin: EdgeInsets.only(left: 10, top: 10),
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
