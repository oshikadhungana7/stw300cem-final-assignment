import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_login/main.dart';
// import 'package:dio_http_cache/dio_http_cache.dart';

import 'package:new_login/response/product_response.dart';
import 'package:new_login/utils/urls.dart';
import 'package:path_provider/path_provider.dart';
import 'http_services.dart';



class ProductAPI{
  Future<ProductResponse?> getProductsByFilter(String? keyword) async {
    ProductResponse? productResponse;
    Response? response;



    try {
      var dio = HttpServices().getDioInstance();
      dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: "http://www.localhost:5000")).interceptor);

      var url = baseUrl + productUrl;
      response = await dio.get(
        url,
        queryParameters: {'keyword':keyword},
        options: buildCacheOptions(const Duration(days: 7))
      );
     
      if (response.statusCode == 200) {
        String postdata = jsonEncode(response.data);
        productResponse = ProductResponse.fromJson(response.data);
      
      }
    } catch (e) {
      print(e.toString());
     
    }
     return productResponse;
  }
}