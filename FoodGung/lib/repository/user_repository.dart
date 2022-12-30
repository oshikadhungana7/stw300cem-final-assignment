import 'package:new_login/api/user_api.dart';

import '../models/user.dart';

class UserRepository{
  Future<bool> register(User user) async {
    return await UserAPI().register(user);
  }
  Future <bool> login (String email, String password){
    return UserAPI().login(email, password);
  }

  Future<bool> updateProfile(String name, String email) {
    return UserAPI().updateProfile(name,email);
  }
  Future<bool> changePassword(String oldPassword, String newPassowrd,String confirmPassword) {
    return UserAPI().changePassword(oldPassword,newPassowrd,confirmPassword);
  }

}