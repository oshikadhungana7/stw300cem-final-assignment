// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:wear/wear.dart';
// import '../../models/product.dart';
// import '../../repository/product_repository.dart';
// import '../../response/product_response.dart';
// import '../../widgets/wearwidgets/CategoriesWidget.dart';
// import '../../widgets/wearwidgets/ItemsWidget.dart';

// class WearHomePage extends StatefulWidget {
//   const WearHomePage({Key? key}) : super(key: key);

//   @override
//   State<WearHomePage> createState() => _WearHomePageState();
// }

// class _WearHomePageState extends State<WearHomePage> {
//   String? search;
//   @override
//   Widget build(BuildContext context) {
    
//     return WatchShape(
//       builder: (BuildContext context, WearShape shape, Widget? child) {
//       return AmbientMode(
//         builder: (context, mode, child) {
//           return Scaffold(
//       body: ListView(
//         children: [
//           // const HomeAppBar(),
//           Container(
//             padding: const EdgeInsets.only(top: 20),
//             decoration: const BoxDecoration(
//                 color: Color(0xFFEDECF2),
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(35),
//                     topRight: Radius.circular(35))),
//             child: Column(
//               children: [
//                 Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 15),
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   height: 20,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(30)),
//                   child: Row(
//                     children: [
//                       Container(
//                         margin: const EdgeInsets.only(left: 1),
//                         height: 20,
//                         width: 60,
//                         child: TextFormField(
//                           onChanged: (value) {
//                             setState(() {
//                               search = value;
//                               print(search);
//                             });
//                           },
//                           decoration: const InputDecoration(
//                               border: InputBorder.none,
//                               hintText: "Search Here...",
//                               hintStyle: TextStyle(fontSize: 7)),
//                         ),
//                       ),
//                       const Spacer(),
//                       const Icon(
//                         Icons.search,
//                         size: 15,
//                         color: Color(0xFF4C53a5),
//                       )
//                     ],
//                   ),
//                 ),
//                 Container(
//                   alignment: Alignment.centerLeft,
//                   margin:
//                       const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//                   child: const Text(
//                     "Categories",
//                     style: TextStyle(
//                         fontSize: 7,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF4C53a5)),
//                   ),
//                 ),

//                 //Categories
//                 CategoriesWidget(),

//                 //Items
//                 Container(
//                   alignment: Alignment.centerLeft,
//                   margin:
//                       const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                   child: const Text(
//                     "All Products",
//                     style: TextStyle(
//                         fontSize: 7,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF4C53a5)),
//                   ),
//                 ),

//                 FutureBuilder<ProductResponse?>(
//                   future: ProductRepository().showFilteredProduct(search),
//                   builder: ((context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.done) {
//                       if (snapshot.hasData) {
//                         List<Product> lstProduct = snapshot.data!.products!;

//                         print(lstProduct[0].images![0].url);

//                         return CarouselSlider.builder(
//                           itemCount: lstProduct.length,
//                           options: CarouselOptions(
//                             height: MediaQuery.of(context).size.height,
//                             aspectRatio: 2.0,
//                             // pageSnapping: false,
//                             enableInfiniteScroll: false,
//                             enlargeCenterPage: true,
//                             viewportFraction: 1,
//                           ),
//                           itemBuilder: (context, index, realIndex) {
//                             return ItemsWidget(
//                                 onPressed: () {
//                                   Navigator.pushNamed(context, '/itemPage',
//                                       arguments: {
//                                         'id': lstProduct[index].id,
//                                         'image':
//                                             lstProduct[index].images![0].url,
//                                         'name': lstProduct[index].name,
//                                         'price': lstProduct[index].price,
//                                         'description':
//                                             lstProduct[index].description,
//                                         'category': lstProduct[index].category,
//                                         'review': lstProduct[index].reviews
//                                       });
//                                 },
//                                 productImage:
//                                     lstProduct[index].images![0].url.toString(),
//                                 productName: lstProduct[index].name,
//                                 productPrice: lstProduct[index].price!.toInt(),
//                                 productDescription:
//                                     lstProduct[index].description);
//                           },
//                         );
//                       }
//                     } else if (snapshot.connectionState ==
//                         ConnectionState.waiting) {
//                       return const Center(
//                         child: CupertinoActivityIndicator(
//                           radius: 20,
//                         ),
//                       );
//                     }
//                     return const Text("Error");
//                   }),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ));
//       });
//   }
// );}
// }