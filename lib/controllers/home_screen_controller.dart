import 'package:fave_films/models/movie.dart';
import 'package:fave_films/network/response_models/movies_response_model.dart';
import 'package:fave_films/services/movies_api_service.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final movies = <MoviesResponseModel>[].obs;
  final favoriteMovies = <Movie>[].obs;

  Future<void> getMovies() async {
    var response = await MoviesApiService.getMovies(type: "popular");
    movies.add(response);
  }

  void addToFavorites(Movie movie) {
    favoriteMovies.insert(0, movie);
  }

  void removeFromFavorites(Movie movie) {
    favoriteMovies.remove(movie);
  }
}
