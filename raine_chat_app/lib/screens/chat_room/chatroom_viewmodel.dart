import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raine_chat_app/app/locator.dart';
import 'package:raine_chat_app/models/message.dart';
import 'package:raine_chat_app/services/authentication_services.dart';
import 'package:raine_chat_app/services/firestore_services.dart';
import 'package:stacked/stacked.dart';

class ChatRoomViewModel extends BaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final AuthenticationService authenticationService =
      locator<AuthenticationService>();

  Stream<QuerySnapshot> messageStream() {
    return _firestoreService.messageColRef.orderBy("timestamp", descending: true).snapshots();
  }

  void messageSend({String message}) async {
    Message newMessage = Message();
    newMessage.name = authenticationService.user.username;
    newMessage.message = message;
    newMessage.timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    await _firestoreService.messageColRef.doc().set(newMessage.toMap());
  }
}
