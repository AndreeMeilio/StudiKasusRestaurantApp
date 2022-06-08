class Restaurant {
  String _id;
  String _name;
  String _description;
  String _pictureId;
  String _city;
  double _rating;
  Map<String, dynamic> _menus;

  Restaurant(
      {required String id,
      required String name,
      required String description,
      required String pictureId,
      required String city,
      required double rating,
      required Map<String, dynamic> menus})
      : _id = id,
        _name = name,
        _description = description,
        _pictureId = pictureId,
        _city = city,
        _rating = rating,
        _menus = menus;

  factory Restaurant.fromJson(var json) {
    return Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: double.parse(json["rating"].toString()),
        menus: json["menus"]);
  }

  String get id => _id;
  String get name => _name;
  String get description => _description;
  String get pictureId => _pictureId;
  String get city => _city;
  double get rating => _rating;
  Map<String, dynamic> get menus => _menus;
}
