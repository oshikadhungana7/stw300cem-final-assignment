// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:new_login/response/login_response.dart';
// import 'package:new_login/screens/Dashboard/dashboard_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AuthController{
//   static login() async{
//     var response = LoginResponse();
//     String? token = response.token;
//     print(token);
//     var preferences= await SharedPreferences.getInstance();
//     preferences.setString("userData", json.encode(token));
//     Get.off(Dashboard());
//   }
//   tryAutoLogin() async{
//     var store =await SharedPreferences.getInstance();
//     if (!store.containsKey("userData")){
//       return false;
//     }
//     else{
//       return true;
//     }
//   }
// }