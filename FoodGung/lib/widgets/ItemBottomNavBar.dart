import 'dart:math';

import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:provider/provider.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../models/cart_model.dart';
import '../repository/review_repository.dart';
import '../screens/Cart/cart_provider.dart';
import '../screens/Cart/db_helper.dart';
import '../screens/HomePage/homepage.dart';

class ItemBottomNavBar extends StatefulWidget {
  const ItemBottomNavBar({Key? key}) : super(key: key);

  @override
  State<ItemBottomNavBar> createState() => _ItemBottomNavBarState();
}

class _ItemBottomNavBarState extends State<ItemBottomNavBar> {

   var rating;
  var comment = "";
  _addReview(bool isReview){
    if(isReview){
      Navigator.push(context, MaterialPageRoute(builder: (context){return const HomePage();}));
    }
    else{
      MotionToast.error(description: const Text("Review adding failed")).show(context);
    }
  }

   DBHelper? dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
      final random = Random();
      int id1 = random.nextInt(1500);
       final cart  = Provider.of<CartProvider>(context);
      final args = ModalRoute.of(context)!.settings.arguments as Map;

      String id = args['id'];
      String name = args['name'];
      int price = args['price'];
      String image = args['image'];
      _postReview() async{
    try{
      ReviewRepository reviewRepository = ReviewRepository();
      bool lstReview= await reviewRepository.addReview(
        id,
        rating,
        comment);

        

      if(lstReview){
        _addReview(true);
      }
      else{
        _addReview(false);
      }
    }
     catch(e){
      MotionToast.error(
        description: Text("Error: ${e.toString()}"),
        ).show(context);
    }
  }

   void  submitReview(){
     showDialog(
              context: context,
              builder: (context){
                return RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        'Submit Review',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        'Tap a star to set your rating. Add comment if you will to.',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image: Image.asset("assets/images/rating.jpg",height: 120,),
      submitButtonText: 'Submit',
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        // print('rating: ${response.rating}, comment: ${response.comment}'); 
        setState(() {
          rating = response.rating.toInt();
          comment = response.comment.toString();
        });
        print(rating);
        print(comment);
        _postReview();
      },
    );
;
              }
            );
  }
    return BottomAppBar(
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0,3)
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             ElevatedButton.icon(
              onPressed: (){submitReview();}, 
              icon: Icon(Icons.add),
              label: Text(
                "Submit Review",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF4C53A5)),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 13,horizontal: 15)
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  )
                )
                  
               ),
              ),
            ElevatedButton.icon(
              onPressed: (){
                dbHelper!.insert(
                    Cart(
                        id: id1,
                        productId: id.toString(),
                        productName: name.toString(),
                        initialPrice: price,
                        productPrice:price ,
                        quantity: 1,
                        unitTag: name.toString(),
                        image: image.toString())
                  ).then((value){

                    cart.addTotalPrice(double.parse(price.toString()));
                    cart.addCounter();

                    final snackBar = SnackBar(backgroundColor: Colors.green,content: Text('Product is added to cart'), duration: Duration(seconds: 1),);

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  }).onError((error, stackTrace){
                    print("error"+error.toString());
                    final snackBar = SnackBar(backgroundColor: Colors.red ,content: Text('Product is already added in cart'), duration: Duration(seconds: 1));

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  });
                  // Navigator.pushNamed(context, '/productList',arguments: 
                  //               {
                  //                   id:id,
                  //                   name:name,
                  //                   image:image,
                  //                   price:price                  
                  //               }
                                  
                  //                 );
              }, 
              
              icon: Icon(Icons.shopping_cart_checkout),
              label: Text(
                "Add to Cart",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF4C53A5)),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 13,horizontal: 15)
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  )
                )
                  
               ),
              )
          ],
        ),
      ),
    );
  }
}