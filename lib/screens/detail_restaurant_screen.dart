import 'package:belajaranimasi/models/restaurant_model.dart';
import 'package:flutter/material.dart';

class DetailRestaurantScreen extends StatelessWidget {
  const DetailRestaurantScreen({Key? key, required Restaurant restaurant})
      : _restaurant = restaurant,
        super(key: key);

  final Restaurant _restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            color: Colors.greenAccent,
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: Hero(
                tag: "restaurant-${_restaurant.pictureId}",
                child: Image.network(
                  _restaurant.pictureId,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                _restaurant.name,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: <Widget>[
                  const Icon(Icons.location_on_sharp),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      _restaurant.city,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Text(_restaurant.rating.toString()),
                  const Icon(
                    Icons.star,
                    color: Colors.greenAccent,
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
              child: Text(
                "Description",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                _restaurant.description,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
              child: Text(
                "Menus",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 30),
              child: MenusTabBar(menus: _restaurant.menus),
            )
          ],
        ),
      ),
    );
  }
}

class MenusTabBar extends StatelessWidget with PreferredSizeWidget {
  const MenusTabBar({Key? key, required Map<String, dynamic> menus})
      : _menus = menus,
        super(key: key);

  final Map<String, dynamic> _menus;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Column(
          children: <Widget>[
            TabBar(
              indicatorColor: Colors.greenAccent,
              physics: const BouncingScrollPhysics(),
              tabs: [
                Tab(
                  child: Text(
                    "Foods",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Tab(
                  child: Text(
                    "Drinks",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
            MenusTabContent(menus: _menus)
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class MenusTabContent extends StatelessWidget {
  const MenusTabContent({Key? key, required Map<String, dynamic> menus})
      : _menus = menus,
        super(key: key);

  final Map<String, dynamic> _menus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: TabBarView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          ListTabContentFoods(listFoods: _menus["foods"]),
          ListTabContentDrinks(listDrinks: _menus["drinks"])
        ],
      ),
    );
  }
}

class ListTabContentFoods extends StatelessWidget {
  const ListTabContentFoods({Key? key, required List<dynamic> listFoods})
      : _listFoods = listFoods,
        super(key: key);

  final List<dynamic> _listFoods;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: _listFoods.length,
      itemBuilder: (context, index) => Card(
        color: Colors.grey[100],
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Text(
            _listFoods[index]["name"],
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    );
  }
}

class ListTabContentDrinks extends StatelessWidget {
  const ListTabContentDrinks({Key? key, required List<dynamic> listDrinks})
      : _listDrinks = listDrinks,
        super(key: key);

  final List<dynamic> _listDrinks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: _listDrinks.length,
      itemBuilder: (context, index) => Card(
        color: Colors.grey[100],
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Text(
            _listDrinks[index]["name"],
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    );
  }
}
