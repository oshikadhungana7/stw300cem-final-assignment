// import 'package:flutter/material.dart';
// import 'package:new_login/repository/product_repository.dart';
// import 'package:new_login/response/product_response.dart';
// import 'package:new_login/screens/ProductDetails/components/product_details.dart';

// import '../../../models/product.dart';


// class ProductDetailsScreen extends StatelessWidget {
//   const ProductDetailsScreen({Key? key}) : super(key: key);
  

//   @override
//   Widget build(BuildContext context) {
//     final args = ModalRoute.of(context)!.settings.arguments as ProductDetails;
//     return Scaffold(
//        body: FutureBuilder<ProductResponse?>(
//          future: ProductRepository().showProduct(),
//          builder: ((context,snapshot){
//           if(snapshot.connectionState==ConnectionState.done){
//             if(snapshot.hasData){
//               List<Product> lstProduct =snapshot.data!.products!;
//               return GridView.builder(
//                 shrinkWrap: true,
//                 primary: true,
//                 itemCount: lstProduct.length,
//                 gridDelegate:
//                   const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 0.7,
//                   ),
//                    itemBuilder: (context, index) {
//                       var data = lstProduct[index];
//                       return ProductDetails(
                        
//                       );
//                    }
//                 );
//             }
//           }
//            else if (snapshot.connectionState==ConnectionState.waiting){
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }
//           return Text("Error");
//          }),
//        )
//     );
//   }
// }