import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_login/response/order_response.dart';
import 'package:new_login/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'http_services.dart';

class OrderAPI{
   Future<OrderResponse> getOrderHistory() async{
    OrderResponse? orderResponse;
    try{
      var url = baseUrl2 + getOrderHistoryUrl;
      var dio = HttpServices().getDioInstance();
      SharedPreferences preferences;
      preferences = await SharedPreferences.getInstance();
      var token = preferences.getString('token');
      var response = 
        await dio.get(
          url,
          options: Options(
            headers: {
              HttpHeaders.authorizationHeader:"Bearer $token"
            }
          )
        );
        if(response.statusCode == 200){
          orderResponse = OrderResponse.fromJson(response.data);
         
        }
    } catch(e){
      debugPrint(e.toString());
    }
    return orderResponse!;
  }
}

 