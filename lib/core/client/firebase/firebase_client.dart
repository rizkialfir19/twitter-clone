import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:twitter_clone/core/core.dart';

class FirebaseClient extends BaseFirebaseClient {
  FirebaseClient._createInstance();

  static final FirebaseClient _instance = FirebaseClient._createInstance();
  static FirebaseClient get instance => _instance;

  FirebaseApp? _firebaseApp;
  FirebaseFirestore? _fireStore;

  @override
  Future<void> initializeApp() async {
    _firebaseApp = await Firebase.initializeApp();
  }

  @override
  FirebaseAuth initializeAuth() {
    return FirebaseAuth.instance;
  }

  @override
  FirebaseFirestore? initializeFirestore() {
    _fireStore = FirebaseFirestore.instance;

    return _fireStore;
  }

  @override
  CollectionReference<Object?> initializeCollection() {
    return _fireStore!.collection('tweets');
  }
}
