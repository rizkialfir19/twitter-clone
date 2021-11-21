import 'package:firebase_core/firebase_core.dart';
import 'package:twitter_clone/core/core.dart';

class FirebaseClient extends BaseFirebaseClient {
  FirebaseClient._createInstance();

  static final FirebaseClient _instance = FirebaseClient._createInstance();
  static FirebaseClient get instance => _instance;

  FirebaseApp? _firebaseApp;

  @override
  Future<void> initializeApp() async {
    _firebaseApp = await Firebase.initializeApp();
  }
}
