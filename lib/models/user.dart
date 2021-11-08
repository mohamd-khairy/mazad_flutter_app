class User {
  int id;
  String name;
  String email;
  String phone;
  String gender;
  DateTime birth_date;

  User({this.id, this.name, this.email, this.phone, this.gender , this.birth_date});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'] ?? '',
      name: json['user']['name'] ?? '',
      email: json['user']['email'] ?? '',
      phone: json['user']['phone'] ?? '',
      gender: json['user']['gender'] ?? '',
      birth_date: json['user']['birth_date'] ?? '',
    );
  }
}
