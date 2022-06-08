import 'package:belajaranimasi/models/restaurant_model.dart';
import 'package:belajaranimasi/services/restaurant_service.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Icon(
                Icons.fastfood,
                color: Colors.greenAccent,
                size: 75,
              ),
              const Text(
                "Rest Toran",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  "Find best Rest Toran near you!",
                  style: TextStyle(color: Colors.grey[700], fontSize: 20),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Text(
                  "Best Restaurants",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                child: ListRestaurantContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListRestaurantContent extends StatelessWidget {
  ListRestaurantContent({Key? key}) : super(key: key);

  final RestaurantService _restaurantService = RestaurantService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _restaurantService.listDataRestaurant(),
      builder: (context, AsyncSnapshot<List<Restaurant>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) => RestaurantContent(
              restaurant: snapshot.data![index],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class RestaurantContent extends StatelessWidget {
  const RestaurantContent({Key? key, required Restaurant restaurant})
      : _restaurant = restaurant,
        super(key: key);

  final Restaurant _restaurant;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[100],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(10),
              child: Hero(
                tag: "restaurant-${_restaurant.pictureId}",
                child: Image.network(
                  _restaurant.pictureId,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              )),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _restaurant.name,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.location_on_sharp,
                        color: Colors.greenAccent,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(_restaurant.city)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.star,
                        color: Colors.greenAccent,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(_restaurant.rating.toString())
                    ],
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            iconSize: 40,
            onPressed: () {
              Navigator.pushNamed(context, "/detail_restaurant",
                  arguments: _restaurant);
            },
            icon: const Icon(
              Icons.play_arrow,
              size: 40,
              color: Colors.greenAccent,
            ),
          )
        ],
      ),
    );
  }
}
