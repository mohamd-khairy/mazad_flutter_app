class User {
  int id;
  String name;
  String email;
  String phone;
  String gender;
  String birth_date;
  String image;

  User(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.gender,
      this.birth_date,
      this.image});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      gender: json['gender'] ?? '',
      birth_date: json['birth_date'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
