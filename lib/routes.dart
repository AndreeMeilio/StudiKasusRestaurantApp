import 'package:belajaranimasi/models/restaurant_model.dart';
import 'package:belajaranimasi/screens/detail_restaurant_screen.dart';
import 'package:belajaranimasi/screens/restaurant_screen.dart';
import 'package:belajaranimasi/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoutesGenerator {
  static Route<dynamic> routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case "/restaurants":
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const RestaurantScreen(),
        );
      case "/detail_restaurant":
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                DetailRestaurantScreen(
                    restaurant: settings.arguments as Restaurant),
            transitionDuration: const Duration(milliseconds: 750),
            reverseTransitionDuration: const Duration(milliseconds: 750),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            });
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}
