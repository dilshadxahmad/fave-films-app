import 'package:fave_films/data/network/network_api_service.dart';
import 'package:fave_films/models/home/movies_response_model.dart';

import 'package:fave_films/res/urls/app_url.dart';

class HomeRepository {
  final _apiService = NetworkApiService();

  Future<MoviesResponseModel> getMovies(String movieType) async {
    try {
      final response = await _apiService.get('${AppUrl.apiBaseUrl}$movieType');
      return MoviesResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
