import 'package:fave_films/models/movie.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final favoriteMovieIds = <int>[].obs;
  final favoriteMovies = <Movie>[].obs;

  void addToFavoriteMovieIds(int id) {
    favoriteMovieIds.add(id);
  }

  void removeFromFavoriteMovieIds(int id) {
    favoriteMovieIds.remove(id);
  }

  void addToFavorites(Movie movie) {
    favoriteMovies.insert(0, movie);
  }

  void removeFromFavorites(Movie movie) {
    favoriteMovies.remove(movie);
  }
}
