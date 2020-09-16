// import 'package:ctmobile/models/message.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:ctmobile/models/case.dart';

// class ChatWidget extends StatelessWidget {
//   final Case casePatient;
//   final int index;
//   final List<Message> model;
//   final bool isReceived;

//   const ChatWidget(
//       {Key key,
//       @required this.casePatient,
//       @required this.model,
//       @required this.index,
//       this.isReceived = false})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
//           child: isReceived
//               ? Column(
//                   children: <Widget>[
//                     Container(
//                       alignment: Alignment.centerRight,
//                       child: Container(
//                         constraints: BoxConstraints(
//                             maxWidth:
//                                 MediaQuery.of(context).size.width * 3 / 4),
//                         padding: EdgeInsets.all(12.0),
//                         decoration: BoxDecoration(
//                           color: Color(0xff0084FF),
//                           borderRadius: BorderRadius.circular(25.0),
//                         ),
//                         child: Text(
//                           "${model[index].message}",
//                           style: TextStyle(fontSize: 18.0, color: Colors.white),
//                         ),
//                       ),
//                     ),
//                     isLastMessageRight(index, model, casePatient)
//                         ? Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: <Widget>[
//                               Container(
//                                 child: Text(
//                                   DateFormat('dd MMM KK:mm a').format(
//                                       DateTime.fromMillisecondsSinceEpoch(
//                                           int.parse(model[index].timestamp))),
//                                   style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 12.0,
//                                       fontStyle: FontStyle.italic),
//                                 ),
//                                 margin: EdgeInsets.only(right: 12),
//                               ),
//                             ],
//                           )
//                         : Container()
//                   ],
//                 )
//               : Column(
//                   children: <Widget>[
//                     Container(
//                       alignment: Alignment.centerLeft,
//                       child: Row(
//                         children: <Widget>[
//                           Padding(
//                             padding: const EdgeInsets.only(right: 8.0),
//                             child: CircleAvatar(
//                               backgroundColor: Colors.red,
//                               child: Text(
//                                 casePatient.firstName
//                                     .substring(0, 1)
//                                     .toUpperCase(),
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                               radius: 12.0,
//                             ),
//                           ),
//                           Container(
//                             constraints: BoxConstraints(
//                                 maxWidth:
//                                     MediaQuery.of(context).size.width * 3 / 4),
//                             padding: EdgeInsets.all(12.0),
//                             decoration: BoxDecoration(
//                               color: Color(0x99eeeeee),
//                               borderRadius: BorderRadius.circular(25.0),
//                             ),
//                             child: Text(
//                               "${model[index].message}",
//                               style: TextStyle(
//                                   fontSize: 18.0, color: Colors.black),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     isLastMessageLeft(index, model, casePatient)
//                         ? Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: <Widget>[
//                               Container(
//                                 child: Text(
//                                   DateFormat('dd MMM KK:mm a').format(
//                                       DateTime.fromMillisecondsSinceEpoch(
//                                           int.parse(model[index].timestamp))),
//                                   style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 12.0,
//                                       fontStyle: FontStyle.italic),
//                                 ),
//                                 margin: EdgeInsets.only(left: 30),
//                               ),
//                             ],
//                           )
//                         : Container()
//                   ],
//                 ),
//         ),
//       ],
//     );
//   }

//   bool isLastMessageLeft(int index, List<Message> model, Case casePatient) {
//     if ((index > 0 &&
//             model != null &&
//             model[index - 1].receiverUid == casePatient.id) ||
//         index == 0) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   bool isLastMessageRight(int index, List<Message> model, Case casePatient) {
//     if ((index > 0 &&
//             model != null &&
//             model[index - 1].receiverUid != casePatient.id) ||
//         index == 0) {
//       return true;
//     } else {
//       return false;
//     }
//   }
// }
