import 'package:dio/dio.dart';
// this test
class ServerError implements Exception {
  String? serverMessage;
  int? statusCode;
  ServerError(this.statusCode, this.serverMessage);
}
// test name branch
class DioHttpException implements Exception {
  DioException? exception;

  DioHttpException(this.exception);
}

class NoInternetError implements Exception {}
