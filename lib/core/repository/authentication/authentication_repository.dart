part of 'base_authentication_repository.dart';

class AuthenticationRepository extends BaseAuthenticationRepository {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final BaseFirebaseClient firebaseClient;

  AuthenticationRepository({required this.firebaseClient});

  @override
  Future<TwitterUser?> signIn(
      {required String email, required String password}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<TwitterUser?> signUp({
    required String email,
    required String username,
    required String fullName,
    required String password,
  }) async {
    try {
      FirebaseAuth _auth = firebaseClient.initializeAuth();

      UserCredential data = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      debugPrint("---> DATA dari repository: $data");
    } on FirebaseAuthException catch (e) {
      debugPrint('----> Error firebaseAuth: $e');
    }
  }
}
