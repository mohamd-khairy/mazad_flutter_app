// ignore: camel_case_types
class user_details {
  Object user;
  String token;

  user_details({this.user, this.token});

  factory user_details.fromJson(Map<String, dynamic> json) {
    return user_details(
      user: json['user']['user'] ?? '',
      token: json['user']['token'] ?? '',
    );
  }
}
