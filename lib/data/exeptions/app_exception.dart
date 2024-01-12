class AppException implements Exception {
  final String? _message;

  AppException([this._message]) {
    print('This is an exception: $_message');
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

class FetchDataException extends AppException {
  FetchDataException([message]) : super(message);
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message);
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message);
}

class InvalidInputException extends AppException {
  InvalidInputException([message]) : super(message);
}
