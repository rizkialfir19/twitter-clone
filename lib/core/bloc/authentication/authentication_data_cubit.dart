import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone/common/common.dart';

import '../../core.dart';

part 'authentication_state.dart';

class AuthenticationDataCubit extends Cubit<BaseState<TwitterUser>> {
  final AppSetupCubit appSetupCubit;
  final BaseFirebaseClient firebaseClient;
  final BaseLocalStorageClient localStorageClient;

  late StreamSubscription appSetupCubitSubs;

  AuthenticationDataCubit({
    required this.appSetupCubit,
    required this.firebaseClient,
    required this.localStorageClient,
  }) : super(InitializedState()) {
    appSetupCubitSubs = appSetupCubit.stream.listen((state) {
      if (state == AppSetupState.success) {
        initialize();
      }
    });
  }

  @override
  Future<void> close() {
    appSetupCubitSubs.cancel();
    return super.close();
  }

  void initialize() async {
    debugPrint("---> Masuk initialize authDataCubit");
    String? _rawUserData;
    TwitterUser? _twitterUserData;

    /// Get & Check Local Token
    try {
      ///TODO: Get User Data
      _rawUserData = await localStorageClient.getByKey(
        SharedPrefKey.userData,
        SharedPrefType.string,
      );

      debugPrint('[$this - getUserData] - Result : $_rawUserData');

      if (_rawUserData == null) {
        emit(UnauthenticatedState());
        return;
      }
    } catch (e, s) {
      debugPrint("---> Masuk error e: $e");
      debugPrint("---> Masuk error s: $s");
      emit(UnauthenticatedState());
      return;
    }

    /// Parse Raw User Data To Model
    try {
      _twitterUserData = TwitterUser.fromJson(jsonDecode(_rawUserData));
      debugPrint('[$this] - Get User Name : ${_twitterUserData.username}');

      if (_twitterUserData.username == null) {
        emit(UnauthenticatedState());
        return;
      }
    } catch (e, s) {
      debugPrint("---> Masuk error e: $e");
      debugPrint("---> Masuk error s: $s");
      emit(UnauthenticatedState());
      return;
    }

    /// All Passed
    emit(
      AuthenticatedState(
        data: _twitterUserData,
        timestamp: DateTime.now(),
      ),
    );
  }
}
