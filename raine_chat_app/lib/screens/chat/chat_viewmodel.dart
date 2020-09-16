// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ctmobile/app/locator.dart';
// import 'package:ctmobile/models/message.dart';
// import 'package:ctmobile/services/user_services.dart';
// import 'package:stacked/stacked.dart';
// import 'package:ctmobile/models/case.dart';

// class ChatViewModel extends StreamViewModel<List<Message>> {
//   Stream _currentSource;
//   Case casePatient;
//   final UserService userService = locator<UserService>();
//   final CollectionReference messageCollectionReference =
//       Firestore.instance.collection('Message');

//   ChatViewModel({this.casePatient}) {
//     print('ChatViewModel created');
//     _setSource();
//   }

//   void _setSource() {
//     _currentSource = listMessage();
//   }

//   Stream<List<Message>> listMessage() {
//     return messageCollectionReference
//         .document(userService.user.id)
//         .collection(casePatient.id)
//         .orderBy('timestamp', descending: true)
//         .snapshots()
//         .map((snapshot) =>
//             snapshot.documents.map((e) => Message.fromMap(e.data)).toList());
//   }

//   void addMessageToDb(Message message) async {
//     print(casePatient.id);
//     message.timestamp = DateTime.now().millisecondsSinceEpoch.toString();
//     message.senderUid = userService.user.id;
//     message.receiverUid = casePatient.id;
//     message.type = "text";

//     await messageCollectionReference
//         .document(userService.user.id)
//         .collection(casePatient.id)
//         .add(message.toMap());
//     await messageCollectionReference
//         .document(casePatient.id)
//         .collection(userService.user.id)
//         .add(message.toMap());
//   }

//   @override
//   Stream<List<Message>> get stream => _currentSource;

//   @override
//   void onData(List<Message> data) {}

//   @override
//   void onCancel() {}

//   @override
//   void onSubscribed() {}

//   @override
//   void onError(error) {}
// }
