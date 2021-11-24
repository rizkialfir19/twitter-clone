import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twitter_clone/app.dart';
import 'package:twitter_clone/core/core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Clients instantiation
  final BaseFirebaseClient _firebaseClient = FirebaseClient.instance;
  final BaseLocalStorageClient _localStorageClient =
      SharedPreferenceClient.instance;

  // Repositories instantiation
  final BaseAuthenticationRepository _authenticationRepository =
      AuthenticationRepository(
    firebaseClient: _firebaseClient,
  );

  // Disable Landscape Mode
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  runZonedGuarded(
    () => runApp(
      App(
        // apiClient: _apiClient,
        firebaseClient: _firebaseClient,
        localStorageClient: _localStorageClient,
        authenticationRepository: _authenticationRepository,
      ),
    ),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
