import 'dart:convert';
import 'package:fave_films/data/exeptions/app_exception.dart';
import 'package:fave_films/data/response/request_status.dart';
import 'package:fave_films/models/home/filter_model.dart';
import 'package:fave_films/models/home/movies_response_model.dart';
import 'package:fave_films/models/favorite/movie.dart';
import 'package:fave_films/repository/home/home_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenController extends GetxController {
  final _api = HomeRepository();

  final rxRequestStatus = RequestStatus.loading.obs;

  final rxMoviesResponseModel = MoviesResponseModel().obs;

  Rx<AppException>? rxError;

  final favoritesSPkey = 'fav_movies_sp';

  final rxFavMovies = <Movie>[].obs;

  final rxFilters = [
    FilterModel(
      id: 1,
      title: 'now_playing'.tr,
      value: true,
    ),
    FilterModel(
      id: 2,
      title: 'top_rated'.tr,
      value: false,
    ),
    FilterModel(
      id: 3,
      title: 'popular'.tr,
      value: false,
    ),
    FilterModel(
      id: 4,
      title: 'upcoming'.tr,
      value: false,
    ),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    _loadRxFavMoviesData();
  }

  void setRxFilterValue(int index) {
    for (var filter in rxFilters) {
      filter.value = (index == filter.id);
    }
    rxFilters.refresh();
  }

  void _setRxRequestStatus(RequestStatus value) =>
      {rxRequestStatus.value = value};

  void _setRxMoviesResponseModel(MoviesResponseModel value) =>
      {rxMoviesResponseModel.value = value};

  void getRxMovies(String movieType) {
    _setRxRequestStatus(RequestStatus.loading);
    _api.getMovies(movieType).then((value) {
      _setRxRequestStatus(RequestStatus.completed);
      _setRxMoviesResponseModel(value);
    }).onError((AppException error, stackTrace) {
      _setRxRequestStatus(RequestStatus.error);
      rxError = error.obs;
    });
  }

  void _loadRxFavMoviesData() async {
    final prefs = await SharedPreferences.getInstance();

    final favoritesJson = prefs.getString(favoritesSPkey) ?? '[]';

    final List<dynamic> favoritesData = json.decode(favoritesJson);

    final favorites =
        favoritesData.map((data) => Movie.fromJson(data)).toList();

    rxFavMovies.clear();

    rxFavMovies.addAll(favorites);
  }

  void toggleFavorite(Movie movie) {
    bool isFavorite = isMovieFavorite(movie);

    if (isFavorite) {
      _removeFromFavorites(movie);
    } else {
      _addToFavorites(movie);
    }
  }

  bool isMovieFavorite(Movie movie) {
    return rxFavMovies.firstWhereOrNull((element) => element.id == movie.id) !=
        null;
  }

  void _addToFavorites(Movie movie) {
    rxFavMovies.add(movie);
    _saveFavoriteMovies();
  }

  void _removeFromFavorites(Movie movie) {
    rxFavMovies
        .remove(rxFavMovies.firstWhere((element) => element.id == movie.id));
    _saveFavoriteMovies();
  }

  void clearFavMovies() async {
    rxFavMovies.clear();
    _saveFavoriteMovies();
  }

  Future<void> _saveFavoriteMovies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(favoritesSPkey, json.encode(rxFavMovies));
  }
}
