import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseFirebaseClient {
  /// Initialize firebase core. This should be called before instantiation of another firebase products
  Future<void> initializeApp();

  FirebaseAuth initializeAuth();

  FirebaseFirestore? initializeFirestore();

  CollectionReference initializeCollection();
}
