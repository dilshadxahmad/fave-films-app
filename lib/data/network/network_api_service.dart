import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:fave_films/data/exeptions/app_exception.dart';
import 'package:fave_films/data/network/i_api_service.dart';
import 'package:fave_films/res/constants/api_keys.dart';
import 'package:fave_films/res/constants/app_constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NetworkApiService implements IApiService {
  @override
  Future<dynamic> get(String url) async {
    dynamic decodedResponse;
    try {
      final response = await http
          .get(Uri.parse(
              '$url?${ApiKeys.tmbdApiKey}&language=${Get.locale?.toLanguageTag()}'))
          .timeout(const Duration(seconds: 20));
      decodedResponse = _returnResponse(response);
    } on SocketException {
      throw InternetException(AppConstants.noInternetMsg);
    } on TimeoutException {
      throw RequestTimeoutException(AppConstants.requestTimeoutMsg);
    }
    return decodedResponse;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic decodedResponse = jsonDecode(response.body);
        return decodedResponse;

      case 400:
        throw BadRequestException(AppConstants.badRequestMsg);

      case 404:
        throw NotFoundException(AppConstants.notFoundMsg);

      case 500:
        throw InternalServerException(AppConstants.internalServerErrorMsg);

      default:
        throw FetchDataException(AppConstants.exceptionMessage);
    }
  }
}
