

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raine_chat_app/app/locator.dart';
import 'package:raine_chat_app/models/user.dart';
import 'package:raine_chat_app/services/firestore_services.dart';

class AuthenticationService {
  final FirestoreService _firestoreService = locator<FirestoreService>();

  User _user;
  User get user => _user;

  Future loginUser({String username, String password}) async {
    QuerySnapshot querySnapshot = await _firestoreService.userColRef.get();
    List<DocumentSnapshot> documents = querySnapshot.docs
        .where((snapshot) =>
            snapshot.data()["username"] == username &&
            snapshot.data()["password"] == password)
        .toList();
    if (documents.length != 0) {
      documents.forEach((result) {
        _user = User.fromMap(result.data());
      });
    } else {
      return true;
    }
    return false;
  }

  Future signupUser({String username, String password}) async {
    try {
      DocumentReference docRef = _firestoreService.userColRef.doc(username);
      await docRef.get().then((docResult) async {
        if (docResult.exists) {
          _user = await _populateUser(user: username);
        } else {
          _firestoreService.userColRef.doc(username).set({
            "username": username,
            "password": password,
          });
          _user = await _populateUser(user: username);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future _populateUser({String user}) {
    return _firestoreService.userColRef
        .doc(user)
        .get()
        .then((result) => User.fromMap(result.data()));
  }

  void logout() {
    _user = null; //Signing out user => null
  }

}
