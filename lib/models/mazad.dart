class Mazad {
  int id;
  String name;
  String details;
  String price;
  String price_min_plus;
  String status;
  List images;
  Object user;
  Object category;
  List comments;
  List asks;
  Object winner;
  DateTime from;
  DateTime to;

  Mazad(
      {this.id,
      this.name,
      this.details,
      this.price,
      this.price_min_plus,
      this.status,
      this.images,
      this.user,
      this.category,
      this.comments,
      this.asks,
      this.winner,
      this.from,
      this.to});

  factory Mazad.fromJson(Map json) {
    return Mazad(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        details: json['details'] ?? '',
        price: json['price'] ?? '',
        price_min_plus: json['price_min_plus'] ?? '',
        status: json['status'] ?? '',
        images: json['images'] ?? '',
        user: json['user'] ?? '',
        category: json['category'] ?? '',
        comments: json['comments'] ?? '',
        asks: json['asks'] ?? '',
        winner: json['winner'] ?? '',
        from: json['from'] ?? '',
        to: json['to']);
  }
}
