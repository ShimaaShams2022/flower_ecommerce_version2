import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio providerDio(){

    Dio dio=Dio();

    return dio;
  }
}