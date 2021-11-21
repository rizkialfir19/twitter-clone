import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twitter_clone/app.dart';
import 'package:twitter_clone/core/core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Clients instantiation
  // final BaseApiClient _apiClient = DioClient.instance;
  final BaseFirebaseClient _firebaseClient = FirebaseClient.instance;
  // final BaseLocalStorageClient _localStorageClient =
  //     SharedPreferenceClient.instance;
  //
  // /// Change Base URL Here
  // final String _baseUrl = EnvConfig.BASE_EXAMPLE_URL;
  //
  // // Repositories instantiation
  // final BaseExampleRepository _exampleRepository = ExampleRepository(
  //   apiClient: _apiClient,
  //   baseUrl: _baseUrl,
  // );

  // Disable Landscape Mode
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  runZonedGuarded(
    () => runApp(
      App(
        // apiClient: _apiClient,
        firebaseClient: _firebaseClient,
        // localStorageClient: _localStorageClient,
        // exampleRepository: _exampleRepository,
      ),
    ),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
