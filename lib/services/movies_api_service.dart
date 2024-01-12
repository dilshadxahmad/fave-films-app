import 'dart:convert';
import 'package:fave_films/network/api_keys.dart';
import 'package:fave_films/network/api_links.dart';
import 'package:fave_films/network/response_models/movies_response_model.dart';
import 'package:http/http.dart' as http;

class MoviesApiService {
  static Future<MoviesResponseModel> getMovies({required String type}) async {
    var response = await http
        .get(Uri.parse("${ApiLinks.apiBaseUrl}$type?${ApiKeys.tmbdApiKey}"));
    MoviesResponseModel convertedResponse =
        MoviesResponseModel.fromJson(jsonDecode(response.body));
    return convertedResponse;
  }
}
