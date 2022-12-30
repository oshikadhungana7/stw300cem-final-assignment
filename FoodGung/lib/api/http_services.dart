import 'package:dio/dio.dart';
import 'package:new_login/utils/urls.dart';


class HttpServices{
  static final HttpServices _instances = HttpServices.internal();
  factory HttpServices () => _instances;
  HttpServices.internal();

  Dio? _dio;
  Dio getDioInstance(){
    if(_dio == null){
      return Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: 10000,
        ),
      );
    }
    else{
      return _dio!;
    }
  }
}