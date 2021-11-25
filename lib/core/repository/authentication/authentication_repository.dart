part of 'base_authentication_repository.dart';

class AuthenticationRepository extends BaseAuthenticationRepository {
  final BaseFirebaseClient firebaseClient;

  AuthenticationRepository({required this.firebaseClient});

  @override
  Future<TwitterUser?> signIn({
    required String email,
    required String password,
  }) async {
    FirebaseAuth _auth = firebaseClient.initializeAuth();
    TwitterUser _tempUser = TwitterUser();

    UserCredential data = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    debugPrint("----> DATA signIn Resp: $data");

    _tempUser = _tempUser.copyWith(
      token: data.user?.refreshToken,
      email: data.user?.email,
      username: data.user?.email?.split('@').first,
      fullName: data.user?.email?.split('@').first,
      password: password,
    );

    return _tempUser;
  }

  @override
  Future<TwitterUser?> signUp({
    required String email,
    required String username,
    required String fullName,
    required String password,
  }) async {
    FirebaseAuth _auth = firebaseClient.initializeAuth();
    TwitterUser _newUser = TwitterUser();

    UserCredential data = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    debugPrint("---> DATA signUp repository: $data");

    _newUser = _newUser.copyWith(
      token: data.user?.refreshToken,
      email: data.user?.email,
      username: username,
      fullName: fullName,
      password: password,
    );

    return _newUser;
  }

  @override
  void signOut() {
    FirebaseAuth _auth = firebaseClient.initializeAuth();

    _auth.signOut();
  }
}
