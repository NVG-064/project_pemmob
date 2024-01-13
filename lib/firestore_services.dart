import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  static FirebaseFirestore? _db;

  FirestoreServices() {
    _db = FirebaseFirestore.instance;
  }
}
