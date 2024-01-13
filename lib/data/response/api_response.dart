import 'package:fave_films/data/response/request_status.dart';

class ApiResponse<T> {
  RequestStatus? requestStatus;
  T? data;
  String? message;

  ApiResponse(this.requestStatus, this.data, this.message);

  ApiResponse.completed(this.data) : requestStatus = RequestStatus.completed;

  ApiResponse.loading() : requestStatus = RequestStatus.loading;

  ApiResponse.error(this.message) : requestStatus = RequestStatus.error;

  @override
  String toString() {
    return "Status: $requestStatus \n Message: $message \n Data: $data";
  }
}
