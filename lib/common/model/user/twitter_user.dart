import 'package:twitter_clone/common/common.dart';

class TwitterUser extends BaseModel {
  final String? token;
  final String? email;
  final String? username;
  final String? fullName;
  final String? password;

  TwitterUser({
    this.token,
    this.email,
    this.username,
    this.fullName,
    this.password,
  }) : super({
          "token": token,
          "email": email,
          "username": username,
          "fullName": fullName,
          "password": password,
        });

  factory TwitterUser.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw FormatException('Null JSON provided');
    }

    return TwitterUser(
      token: json['token'],
      email: json['email'],
      username: json['username'],
      fullName: json['fullName'],
      password: json['password'],
    );
  }

  @override
  copyWith({
    String? token,
    String? email,
    String? username,
    String? fullName,
    String? password,
  }) {
    return TwitterUser(
      token: token ?? this.token,
      email: email ?? this.email,
      username: username ?? this.username,
      fullName: fullName ?? this.fullName,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [
        token,
        email,
        username,
        fullName,
        password,
      ];
}
