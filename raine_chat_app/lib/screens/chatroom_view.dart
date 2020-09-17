// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:shape_of_view/shape_of_view.dart';

// class ChatRoomView extends StatelessWidget {
//   final Stream<QuerySnapshot> _messagesStream = FirebaseFirestore.instance
//       .collection("Message")
//       .orderBy("timestamp")
//       .snapshots();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(100.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AppBar(
//               automaticallyImplyLeading: false,
//               title: Text(
//                 "Chat app",
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             color: Color(0xFF647787),
//             height: 1,
//           ),
//           SizedBox(height: 40),
//           Flexible(
//             child: StreamBuilder(
//               stream: _messagesStream,
//               builder: (BuildContext context,
//                   AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (snapshot.hasError) {
//                   return Center(
//                     child: Text("Error: ${snapshot.error}"),
//                   );
//                 }
//                 switch (snapshot.connectionState) {
//                   case ConnectionState.waiting:
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                     break;
//                   default:
//                     List<DocumentSnapshot> documents = snapshot.data.docs;
//                     return Column(
//                       children: [
//                         Expanded(
//                           child: ListView.builder(
//                             itemCount: documents.length,
//                             itemBuilder: (context, index) {
//                               return _ChatWidget(
//                                 message: documents[index].data()["message"],
//                                 name: documents[index].data()["name"],
//                                 isSendByMe:
//                                     documents[index].data()["name"] == "Raine",
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     );
//                 }
//               },
//             ),
//           ),
//           Container(
//             child: TextFormField(
//               decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.teal,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(
//                       width: 0,
//                       style: BorderStyle.none,
//                     ),
//                   ),
//                   hintText: "Send message",
//                   contentPadding: EdgeInsets.all(10)),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class _ChatWidget extends StatelessWidget {
//   final String name;
//   final String message;
//   final bool isSendByMe;

//   const _ChatWidget({Key key, this.name, this.message, this.isSendByMe})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: 10.0,
//             vertical: 25.0,
//           ),
//           child: isSendByMe
//               ? Column(
//                   children: [
//                     Container(
//                       alignment: Alignment.centerRight,
//                       child: ShapeOfView(
//                         elevation: 0,
//                         shape: BubbleShape(
//                             position: BubblePosition.Right,
//                             arrowPositionPercent: 0.40,
//                             borderRadius: 20,
//                             arrowHeight: 10,
//                             arrowWidth: 10),
//                         child: Container(
//                           constraints: BoxConstraints(
//                             maxWidth: MediaQuery.of(context).size.width * 0.90,
//                           ),
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 30.0, vertical: 20),
//                           decoration: BoxDecoration(
//                             color: Color(0xFF88E306),
//                           ),
//                           child: Text(
//                             "$message",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 24,
//                               letterSpacing: 2,
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(right: 10, top: 10),
//                           child: Text(
//                             "You",
//                             style: TextStyle(
//                               color: Color(0xFF647787),
//                               fontSize: 24,
//                               letterSpacing: 2,
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 )
//               : Column(
//                   children: [
//                     Container(
//                       alignment: Alignment.centerLeft,
//                       child: ShapeOfView(
//                         elevation: 0,
//                         shape: BubbleShape(
//                             position: BubblePosition.Left,
//                             arrowPositionPercent: 0.40,
//                             borderRadius: 20,
//                             arrowHeight: 10,
//                             arrowWidth: 10),
//                         child: Container(
//                           constraints: BoxConstraints(
//                             maxWidth: MediaQuery.of(context).size.width * 0.90,
//                           ),
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 30.0, vertical: 20),
//                           decoration: BoxDecoration(
//                             color: Color(0xFF88E306),
//                           ),
//                           child: Text(
//                             "$message",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 24,
//                               letterSpacing: 2,
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(left: 10, top: 10),
//                           child: Text(
//                             "$name",
//                             style: TextStyle(
//                               color: Color(0xFF647787),
//                               fontSize: 24,
//                               letterSpacing: 2,
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//         ),
//       ],
//     );
//   }
// }
