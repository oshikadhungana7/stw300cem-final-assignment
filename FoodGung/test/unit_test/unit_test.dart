// import 'package:flutter_test/flutter_test.dart';
// import 'package:new_login/models/user.dart';
// import 'package:new_login/repository/product_repository.dart';
// import 'package:new_login/repository/user_repository.dart';
// import 'package:new_login/response/product_response.dart';

// void main() {

//   UserRepository? userRepository;

//   group('User Api Test',(){
//      setUp((){
//     userRepository = UserRepository();
//   });

// test("user registration", () async {
//     bool expectedResult = true;
//     User user = User(
//         name: "userabcd",
//         email: "usergabcd@gmail.com",
//         password: "userabcd12345",);
//     bool actual = await userRepository!.register(user);
//     expect(actual, expectedResult);
//   });

// test("user login",() async{
//   bool expectedResult = true;
//   var email = "usergabcd@gmail.com";
//   var password = "userabcd12345";

//   bool actual = await userRepository!.login(email, password);
//   expect(actual, expectedResult);
// });
// tearDown((){
//   userRepository = null;
// });
//   });
// test("user change password", () async {
//   bool expectedResult = true;

//    String oldPassword = "khadka03adrsh";

//    String newPassword = "khadkaadrsh";

//   String passwordConfirm = "khadkaadrsh";

//   bool actial = await UserRepository()
//    .changePassword(oldPassword, newPassword, passwordConfirm);
//   expect(actial, expectedResult);
//    });

//   ProductRepository? productRepository;
//   group("Product Api Test", (){
//     setUp((){
//       productRepository = ProductRepository();
//     });
//     test("get products", () async{
//       bool expectedResult = true;
//       ProductResponse? actual = await productRepository!.showFilteredProduct("fjio");
//       expect(actual, isNotNull);
//     });    
//   });
// }
 