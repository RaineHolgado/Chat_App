import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  CollectionReference userColRef =
      FirebaseFirestore.instance.collection("User");
  CollectionReference messageColRef =
      FirebaseFirestore.instance.collection("Message");
}
