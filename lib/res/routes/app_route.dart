import 'package:fave_films/res/routes/route_name.dart';
import 'package:fave_films/views/fav_movies_screen.dart';
import 'package:fave_films/views/home_screen.dart';
import 'package:fave_films/views/onboarding_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static appRoutes() => [
        GetPage(
          name: RouteName.onboardingScreen,
          page: () => const OnboardingScreen(),
        ),
        GetPage(
          name: RouteName.homeScreen,
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: RouteName.favMoviesScreen,
          page: () => const FavMoviesScreen(),
        ),
      ];
}
