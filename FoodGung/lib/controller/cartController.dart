// import 'package:get/get.dart';
// import 'package:new_login/models/product.dart';

// import '../models/cartModel.dart';

// class CartController extends GetxController{
//   //Add a dict to store the products in the cart.

//   var _products = {}.obs;

//   void addProduct(Cart products){
//       if(_products.containsKey(products)){
//         _products[products] +=1;
//       }
//       else{
//         _products[products] =1;
//       }
//       Get.snackbar(
//         "Product Added ", 
//         "You have added the ${products.name} to the cart",
//       snackPosition:SnackPosition.BOTTOM,
//       duration: Duration(seconds: 2), 
//       ); 
//   }

//   void removeProduct(Cart products){
//     if(_products.containsKey(products) && _products[products]==1){
//       _products.removeWhere((key, value) => key ==products);
//     }
//     else{
//       _products[products]-=1;
//     }

//   }

//   get products => _products;
// }