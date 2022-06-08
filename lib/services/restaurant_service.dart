import 'dart:convert';

import 'package:belajaranimasi/models/restaurant_model.dart';
import 'package:flutter/services.dart';

class RestaurantService {
  Future<List<Restaurant>> listDataRestaurant() async {
    final String dataFromFile =
        await rootBundle.loadString("assets/restaurants.json");

    final List<dynamic> dataRestaurants =
        jsonDecode(dataFromFile)["restaurants"];
    final List<Restaurant> resultdataRestaurants =
        dataRestaurants.map((value) => Restaurant.fromJson(value)).toList();

    return resultdataRestaurants;
  }
}
