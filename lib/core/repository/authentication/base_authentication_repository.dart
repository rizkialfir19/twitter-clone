import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/core/core.dart';

part 'authentication_repository.dart';

abstract class BaseAuthenticationRepository {
  Future<TwitterUser?> signUp({
    required String email,
    required String username,
    required String fullName,
    required String password,
  });

  Future<TwitterUser?> signIn({
    required String email,
    required String password,
  });
}
