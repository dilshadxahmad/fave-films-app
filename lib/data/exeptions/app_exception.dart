import 'package:flutter/material.dart';

class AppException implements Exception {
  final String? _message;

  AppException([this._message]) {
    debugPrint('This is an exception: $_message');
    // HelperFunction.showToast(
    //   title: AppConstants.failure,
    //   message: _message ?? AppConstants.unknownError,
    //   type: ToastType.failure,
    // );
  }

  @override
  String toString() {
    return "$_message";
  }
}

class InternetException extends AppException {
  InternetException(String message) : super(message);
}

class RequestTimeoutException extends AppException {
  RequestTimeoutException(String message) : super(message);
}

class BadRequestException extends AppException {
  BadRequestException(String message) : super(message);
}

class NotFoundException extends AppException {
  NotFoundException(String message) : super(message);
}

class InternalServerException extends AppException {
  InternalServerException(String message) : super(message);
}

class FetchDataException extends AppException {
  FetchDataException(String message) : super(message);
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String message) : super(message);
}

class InvalidInputException extends AppException {
  InvalidInputException(String message) : super(message);
}
