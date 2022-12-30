import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_login/screens/DetailsPage/ItemPage.dart';
import '../../models/product.dart';
import '../../repository/product_repository.dart';
import '../../response/product_response.dart';
import '../../widgets/CategoriesWidget.dart';
import '../../widgets/HomeAppbar.dart';
import '../../widgets/ItemsWidget.dart';
import 'package:all_sensors/all_sensors.dart';


class HomePage extends StatefulWidget {
  
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _proximityValue = 0;
  final List<StreamSubscription<dynamic>> _streamSubscription =
      <StreamSubscription<dynamic>>[];
  String? search;
  //  void initState() {
  //   super.initState();
  //   _streamSubscription.add(proximityEvents!.listen((ProximityEvent event) {
  //     setState(() {
  //       _proximityValue = event.proximity;
  //       print(_proximityValue);
  //     });
  //     if (_proximityValue < 3) {
  //           Navigator.pushNamed(context, '/itemPage');
  //     }
  //   }));
  // }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: 
      ListView(
        children: [ 
          const HomeAppBar(),
          Container(
            padding: const EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)

              )
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(30)
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          onChanged: (value) {
                                  setState(() {
                                    search = value;
                                    print(search);
                                  });
                                
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search Here..."
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.search,
                        size: 27,
                        color: Color(0xFF4C53a5),
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10
                  ),
                  child: const Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C53a5)
                    ),
                  ),
                ),

              //Categories
              CategoriesWidget(),

              //Items
              Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                  child: const Text("All Products", style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold ,
                    color: Color(0xFF4C53a5)
                  ),
                  ),
              ),

              FutureBuilder<ProductResponse?>(
                  future: ProductRepository().showFilteredProduct(search),
                  builder: ((context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.done){
                       if(snapshot.hasData){
                        List<Product> lstProduct =snapshot.data!.products!;
                          
                        print(lstProduct[0].images![0].url);
                        
                        return GridView.builder(
                           shrinkWrap: true,
                           primary: true,
                           itemCount: lstProduct.length,
                           physics: const NeverScrollableScrollPhysics(),
                           gridDelegate:
                               const SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: 2,
                             childAspectRatio: 0.7,
                           ),
                           itemBuilder: (context, index) {
                             var data = lstProduct[index];
                             return ItemsWidget(
                               onPressed: () {
                                Navigator.pushNamed(context, '/itemPage',arguments: 
                                {
                                  'id':lstProduct[index].id,
                                  'image': lstProduct[index].images![0].url,
                                  'name':lstProduct[index].name,
                                  'price':lstProduct[index].price,
                                  'description':lstProduct[index].description,
                                  'category':lstProduct[index].category,
                                  'review': lstProduct[index].reviews
                                }
                                  
                                  );
                                
                               },
                               
                               productImage: lstProduct[index].images![0].url.toString(),
                               productName: lstProduct[index].name,
                               productPrice: lstProduct[index].price!.toInt(),
                               productDescription: lstProduct[index].description
                             );
                           }
                           );
                       }
                    }
                    else if (snapshot.connectionState==ConnectionState.waiting){
                      return const Center(
                        child: CupertinoActivityIndicator(radius: 20,),
                      );
                    }
                   return const Text("Error");
                  }),
                 ),
              ],
            ),
            
          ),
          
        ],
      ),    
    );
  }
}