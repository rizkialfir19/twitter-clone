import 'package:twitter_clone/common/common.dart';

class TwitterUser extends BaseModel {
  final String? token;
  final String? fcmToken;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;

  TwitterUser({
    this.token,
    this.fcmToken,
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
  }) : super({
          "token": token,
          "email": email,
          "firstname": firstName,
          "lastname": lastName,
          "phonenumber": phoneNumber,
        });

  factory TwitterUser.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw FormatException('Null JSON provided');
    }

    return TwitterUser(
      token: json['token'],
      email: json['email'],
      firstName: json['firstname'],
      lastName: json['lastname'],
      phoneNumber: json['phonenumber'],
    );
  }

  @override
  copyWith({
    String? token,
    String? fcmToken,
    String? email,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? companyName,
  }) {
    return TwitterUser(
      token: token ?? this.token,
      fcmToken: fcmToken ?? this.fcmToken,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  List<Object?> get props => [
        token,
        fcmToken,
        email,
        firstName,
        lastName,
        phoneNumber,
      ];
}
