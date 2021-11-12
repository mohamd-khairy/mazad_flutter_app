// ignore: camel_case_types
import 'package:plant_app/models/user.dart';

class user_details {
  Object user;
  String token;

  user_details({this.user, this.token});

  factory user_details.fromJson(Map<String, dynamic> json) {
    return user_details(
      user: json['user'] ?? '',
      token: json['token'] ?? '',
    );
  }
}
