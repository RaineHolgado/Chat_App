import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raine_chat_app/models/message.dart';
import 'package:raine_chat_app/models/user.dart';

class AuthenticationService {
  static final AuthenticationService _authenticationService =
      new AuthenticationService._internal();

  AuthenticationService._internal();

  factory AuthenticationService() {
    AuthenticationService._internal();
    return _authenticationService;
  }
  void loginUser() {
    //
  }
  void signupUser({User user}) {
    try {
      DocumentReference docRef =
          FirebaseFirestore.instance.collection("User").doc();
      user.id = docRef.id;
      docRef.set(user.toMap());
    } catch (e) {
      print(e);
    }
  }

  void messageRoom({Message message}) {
    try {
      DocumentReference docRef =
          FirebaseFirestore.instance.collection("Message").doc();
      message.timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      message.senderUid = "mJxdWAWpjlMTwVVRUPfl";
      docRef.set(message.toMap());
    } catch (e) {
      print(e);
    }
  }

  Stream<List<Message>> getConversationMessages() {
    return FirebaseFirestore.instance.collection("Message").snapshots().map(
        (result) => result.docs.map((e) => Message.fromMap(e.data())).toList());
  }
}

final authenticationService = AuthenticationService();
