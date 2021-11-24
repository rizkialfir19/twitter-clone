import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/core/core.dart';

class SignUpCubit extends Cubit<BaseState> {
  final BaseLocalStorageClient localStorageClient;
  final BaseAuthenticationRepository authenticationRepository;

  SignUpCubit({
    required this.localStorageClient,
    required this.authenticationRepository,
  }) : super(InitializedState());

  Future<void> signUpAccount({
    required String email,
    required String username,
    required String fullName,
    required String password,
  }) async {
    TwitterUser? _result;
    emit(LoadingState());

    if (email.isEmpty ||
        username.isEmpty ||
        fullName.isEmpty ||
        password.isEmpty) {
      emit(ErrorState(error: 'Masukkan semua field!'));
      return;
    }

    /// Get twitterUserData from repository
    try {
      _result = await authenticationRepository.signUp(
        email: email,
        username: username,
        fullName: fullName,
        password: password,
      );

      if (_result == null) {
        emit(ErrorState(
            error: 'null data',
            data: 'Terjadi Kesalahan, Silahkan coba kembali'));
        return;
      }
    } catch (e, s) {
      debugPrint("----> e: $e");
      debugPrint("----> s: $s");
      emit(ErrorState(error: 'Sign Up Failure Exception'));
    }

    ///Save twitterUserData to Local Data
    try {
      await localStorageClient.saveByKey(
        jsonEncode(_result!.toJson()),
        SharedPrefKey.userData,
        SharedPrefType.string,
      );
    } catch (e, s) {
      debugPrint("----> e: $e");
      debugPrint("----> s: $s");
      emit(ErrorState(
        error: 'Terjadi Kesalahan, silahkan coba lagi!',
      ));
      return;
    }

    /// All Validate Pass
    emit(AuthenticatedState(
      data: _result,
      timestamp: DateTime.now(),
    ));
  }
}
