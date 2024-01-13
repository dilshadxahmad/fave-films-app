import 'package:fave_films/data/exeptions/app_exception.dart';
import 'package:fave_films/data/response/request_status.dart';
import 'package:fave_films/models/home/filter_model.dart';
import 'package:fave_films/models/home/movies_response_model.dart';
import 'package:fave_films/models/movie.dart';
import 'package:fave_films/repository/home/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();
  final rxRequestStatus = RequestStatus.loading.obs;
  final rxMoviesResponseModel = MoviesResponseModel().obs;
  Rx<AppException>? rxError;
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
    _api.getMovies(movieType).then((value) {
      _setRxRequestStatus(RequestStatus.completed);
      _setRxMoviesResponseModel(value);
    }).onError((AppException error, stackTrace) {
      _setRxRequestStatus(RequestStatus.error);
      rxError = error.obs;
    });
  }

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
