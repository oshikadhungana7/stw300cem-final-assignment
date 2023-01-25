// import 'package:flutter/material.dart';
// import 'package:motion_toast/motion_toast.dart';
// import 'package:new_login/repository/review_repository.dart';
// import 'package:new_login/response/review_response.dart';
// import 'package:new_login/screens/HomePage/homepage.dart';
// import 'package:new_login/screens/ProductDetails/components/review_card.dart';
// import 'package:provider/provider.dart';
// import 'package:rating_dialog/rating_dialog.dart';

// import '../../../models/Review.dart';
// import '../../../models/cart_model.dart';
// import '../../../models/product.dart';
// import '../../../repository/product_repository.dart';
// import '../../../response/product_response.dart';
// import '../../Cart/cart_provider.dart';
// import '../../Cart/db_helper.dart';


// class ProductDetails extends StatefulWidget {
//   // route for detail page
//  static const routeName = '/productDetails';

//  final String? productImage;

//   final String? productName;

//   final double? productPrice;

  


//   ProductDetails({
//     this.productImage,
//     this.productName,
//     this.productPrice,
  
//   });
  
//   @override
//   State<ProductDetails> createState() => _ProductDetailsState();
// }

// class _ProductDetailsState extends State<ProductDetails> {
  
//   var rating;
//   var comment = "";
//   _addReview(bool isReview){
//     if(isReview){
//       Navigator.push(context, MaterialPageRoute(builder: (context){return const HomePage();}));
//     }
//     else{
//       MotionToast.error(description: const Text("Review adding failed")).show(context);
//     }
//   }

 
//   int productId=0; 
//  DBHelper? dbHelper = DBHelper();
//   @override
  
//   Widget build(BuildContext context) {
//         final cart  = Provider.of<CartProvider>(context);
    
//      final args = ModalRoute.of(context)!.settings.arguments as Map;

//      String id = args['id'].toString();

//      var name = args['name'].toString();
//      var image=args['image'].toString();
//      var price = args['price'];
//      var description = args['description'].toString();
//      List<Review> review  = args['review'];
//      print(review.length);
//      for(int i=0;i<review.length;i++){
//       print(review[i].name);
//      }

//       _showReview() async{
//     try{
//       ReviewRepository reviewRepository = ReviewRepository();
//       bool lstReview= await reviewRepository.addReview(
//         id,
//         rating,
//         comment);

        

//       if(lstReview){
//         _addReview(true);
//       }
//       else{
//         _addReview(false);
//       }
//     }
//     catch(e){
//       MotionToast.error(
//         description: Text("Error: ${e.toString()}"),
//         ).show(context);
//     }
//   }

//    void  submitReview(){
//      showDialog(
//               context: context,
//               builder: (context){
//                 return RatingDialog(
//       initialRating: 1.0,
//       // your app's name?
//       title: Text(
//         'Submit Review',
//         textAlign: TextAlign.center,
//         style: const TextStyle(
//           fontSize: 25,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       // encourage your user to leave a high rating?
//       message: Text(
//         'Tap a star to set your rating. Add comment if you will to.',
//         textAlign: TextAlign.center,
//         style: const TextStyle(fontSize: 15),
//       ),
//       // your app's logo?
//       image: const FlutterLogo(size: 100),
//       submitButtonText: 'Submit',
//       commentHint: 'Set your custom comment hint',
//       onCancelled: () => print('cancelled'),
//       onSubmitted: (response) {
//         print('rating: ${response.rating}, comment: ${response.comment}'); 
//         setState(() {
//           rating = response.rating.toInt();
//           comment = response.comment.toString();
//         });
//         print(rating);
//         print(comment);
//         _showReview();
//       },
//     );
// ;
//               }
//             );
//   }

//     //  print (args);
    
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//         iconTheme: const IconThemeData(
//           opacity: 20,
         
//           color: Colors.black
//         ),
//       ),
//       body: SafeArea(
//         child: Container(
//           width: double.infinity,
//           height: double.infinity,
//           child: Column(
//             children: [
//               Expanded(
//                 child: Container(
//                   decoration:  BoxDecoration(
//                    color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(40),
//                       bottomRight: Radius.circular(40),
//                     ),
//                     image: DecorationImage(image: NetworkImage("${image}"))
//                   ),
//                 ),
//               ),
      
//               Expanded(
//                 child: Container(
//                 color: Color(0xffaef4ff),
//                 child: ListTile(
//                   title: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.start  ,
//                     children: [
                     
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Center(child: Text("${name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
                        
//                         ],
//                       ),
//                         Row(
//                           children: [
//                             Text("Price:",style: TextStyle(fontWeight: FontWeight.bold),),
//                             SizedBox(width: 20,),
//                             Text("Rs",style:TextStyle(fontWeight: FontWeight.bold)),
//                             Text(" ${price}"),
//                           ],
//                         ),
//                         Text("Description:",style: TextStyle(fontWeight: FontWeight.bold),),
//                         Center(child: Text(" ${description}")),
                          
//                           Center(
//                             child: ElevatedButton(onPressed: (){submitReview(
//                             );
//                             ;},style: ElevatedButton.styleFrom(
//                               primary: Color.fromARGB(255, 167, 103, 103)
//                             ), child: Padding(padding: EdgeInsets.all(16.0),child: Text("Submit Review",style: TextStyle(fontSize: 20),),
//                             )),
//                           ),
//                        Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                             ElevatedButton(onPressed: (){
//                               dbHelper!.insert(
//                                         Cart(
//                                             id: productId.toInt(),
//                                             productId: productId.toString(),
//                                             productName: name.toString(),
//                                             initialPrice: int.parse(price),
//                                             productPrice:int.parse(price) ,
//                                             quantity: 1,
//                                             unitTag: name.toString(),
//                                             image: image.toString())
//                                       ).then((value){

//                                         cart.addTotalPrice(double.parse(price.toString()));
//                                         cart.addCounter();

//                                         final snackBar = SnackBar(backgroundColor: Colors.green,content: Text('Product is added to cart'), duration: Duration(seconds: 1),);

//                                         ScaffoldMessenger.of(context).showSnackBar(snackBar);

//                                       }).onError((error, stackTrace){
//                                         print("error"+error.toString());
//                                         final snackBar = SnackBar(backgroundColor: Colors.red ,content: Text('Product is already added in cart'), duration: Duration(seconds: 1));

//                                         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                                       });
//                             },style: ElevatedButton.styleFrom(primary:Color.fromARGB(255, 167, 103, 103)), child: Text("Add to Cart")
//                             ),
//                             ElevatedButton(onPressed: (){Navigator.pushNamed(context, '/viewreview',arguments:id  );},style: ElevatedButton.styleFrom(
//                               primary:Color.fromARGB(255, 167, 103, 103)
//                             ), child: Text("View Reviews"))
//                         ],
//                        )
                    
//                     ],
//                   ),
//                 ),
                  
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }