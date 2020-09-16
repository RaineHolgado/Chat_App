// import 'package:flutter/material.dart';
// import 'package:raine_chat_app/models/message.dart';

// class ChatView extends StatefulWidget {
//   @override
//   _ChatViewState createState() => _ChatViewState();
// }

// class _ChatViewState extends State<ChatView> {
//   Message message = new Message();

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<ChatViewModel>.reactive(
//       viewModelBuilder: () => ChatViewModel(casePatient: widget.casePatient),
//       builder: (context, model, child) => Scaffold(
//         appBar: AppBar(
//           centerTitle: false,
//           title: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   CircleAvatar(
//                     backgroundColor: Colors.red,
//                     child: Text(
//                       widget.casePatient.firstName
//                           .substring(0, 1)
//                           .toUpperCase(),
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     radius: 14.0,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 8.0),
//                     child: Text(
//                       "${widget.casePatient.firstName} ${widget.casePatient.lastName}",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.normal),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//           actions: <Widget>[
//             IconButton(
//                 icon: Icon(Icons.call), onPressed: () {}),
//             IconButton(
//               icon: Icon(Icons.videocam),
//               onPressed: () {},
//             ),
//             PopupMenuButton(
//               itemBuilder: (context) => [
//                 PopupMenuItem(
//                   child: Text("Info"),
//                   value: "Info",
//                 )
//               ],
//               icon: Icon(
//                 Icons.more_vert,
//               ),
//             )
//           ],
//         ),
//         body: Column(
//           children: <Widget>[
//             Flexible(
//               child: model.data == null
//                   ? Center(child: CircularProgressIndicator())
//                   : ListView.builder(
//                       reverse: true,
//                       itemCount: model.data.length,
//                       itemBuilder: (context, index) {
//                         return ChatWidget(
//                           casePatient: widget.casePatient,
//                           index: index,
//                           model: model.data,
//                           isReceived: model.data[index].senderUid ==
//                               model.userService.user.id,
//                         );
//                       },
//                     ),
//             ),
//             ChatInputWidget(
//               onSubmitted: (val) {
//                 message.message = val;
//                 model.addMessageToDb(message);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }
// }
