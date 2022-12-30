import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_login/api/http_services.dart';
import 'package:new_login/models/orderItems.dart';
import 'package:new_login/models/user.dart';
import 'package:new_login/response/login_response.dart';
import 'package:new_login/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAPI{
  Future <bool> register (User user) async{
    bool isRegister = false;
    Response response;
    var url = baseUrl + registerUrl;
    var dio = HttpServices().getDioInstance();
    try{
      response = await dio.post(
        url,
        data: user.toJson(),
      );
      if(response.statusCode ==201){
        return true;
      }
      
      }
      catch (e){
        debugPrint(e.toString());
    }
    return isRegister;
  }




  Future<bool> login (String email, String password) async {
 

      bool isLogin = false;
      try{
        var url = baseUrl + loginUrl;
        var dio = HttpServices().getDioInstance();
        var response = await dio.post(
          url,
          data: {
            "email": email,
            "password":password
          }
        );
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        String userdata = jsonEncode(response.data['customer']);
        sharedPreferences.setString('userdata',userdata);
         
        if ( response.statusCode == 200){
          String userdata = jsonEncode(response.data['customer']);
          
          LoginResponse loginResponse = LoginResponse.fromJson(response.data);
          
          token = loginResponse.token; 
          // SharedPreferences preferences;
          // preferences= await SharedPreferences.getInstance();
          sharedPreferences.setString("token", '$token');
          // sharedPreferences.setString('customer', userdata);
         
         
          // print(preferences.getString('token'));
          // print(token);
          isLogin = true;
        }
      }
      catch(e){
        debugPrint(e.toString());
      }
      return isLogin;
  }
 Future<bool> updateProfile(String name,String email) async {
    
    bool Update = false;
    try {
      var url = baseUrl + updateProfileUrl;
      var dio = HttpServices().getDioInstance();
     SharedPreferences preferences;
      preferences = await SharedPreferences.getInstance();

      var token = preferences.getString('token');
      print(token);
      var response =
          await dio.put(
            url, 
          data: {"name": name, "email": email},
          options: Options(
            headers: {
              HttpHeaders.authorizationHeader:"Bearer $token"}
            
          )
          );
      if (response.statusCode == 200) {
         Update = true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return Update;
  }

  Future<bool> changePassword(String oldPassword,String newPassowrd,String confirmPassword) async {
    print("Chnage Passwordddddddddd");
    bool changePassword = false;
    try {
      var url = baseUrl + changePasswordUrl;
      var dio = HttpServices().getDioInstance();
   
    SharedPreferences  preferences = await SharedPreferences.getInstance();

      var token = preferences.getString('token');
      var response =
          await dio.put(
            url, 
          data: {"oldPassword": oldPassword, "newPassword": newPassowrd,"confirmPassword":confirmPassword},
          options: Options(
            headers: {
              HttpHeaders.authorizationHeader:"Bearer $token"}
            
          )
          );
      if (response.statusCode == 200) {
         changePassword = true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return changePassword;
  }
}


 
