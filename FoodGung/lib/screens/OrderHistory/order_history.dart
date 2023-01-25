// import 'package:flutter/material.dart';
// import 'package:new_login/repository/order_repository.dart';
// import 'package:new_login/response/order_response.dart';

// import '../../models/order.dart';

// class OrderHistory extends StatefulWidget {
//   static const routeName = "/order";
//    OrderHistory({Key? key}) : super(key: key);


//   @override
//   State<OrderHistory> createState() => _OrderHistoryState();
// }

// class _OrderHistoryState extends State<OrderHistory> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("My Order History"),
//         backgroundColor: const Color(0xFF4C53A5),
//         centerTitle: true,
//       ),
//       body: 
//       SingleChildScrollView(
//         child: Column(
//           children: [
//             FutureBuilder<OrderResponse?>(
//                         future: OrderRepository().getOrderHistory(),
//                         builder: ((context, snapshot) {
//                           if(snapshot.connectionState == ConnectionState.done){
//                              if(snapshot.hasData){
//                               List<Order> lstOrder =snapshot.data!.orders!;
//                               return Column(
//                             children: [
//                               SizedBox(height: 20),
//                               for (var i = 0; i < lstOrder.length; i++)
//                                 GestureDetector(
//                                   onTap: (){
//                                     Navigator.pushNamed(context, '/orderDetails',arguments:{
//                                         'orderItem':lstOrder[i].orderItems
//                                     }         
                                      
//                                     );
//                                   },
//                                   child: Card(
//                                     child: ListTile(
//                                       leading:Text(
//                                           lstOrder[i].id.toString(),
//                                       ), 
//                                       title: Text(
//                                         lstOrder[i].totalPrice.toString(),
//                                         style: TextStyle(fontSize: 10),
//                                       ),
//                                       subtitle: Text(
//                                         lstOrder[i].orderStatus.toString(),
//                                         style: TextStyle(fontSize: 10),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                             ],
//                           );
                              
//                              }
//                           }
//                           else if (snapshot.connectionState==ConnectionState.waiting){
//                             return const Center(
//                               child: CircularProgressIndicator(),
//                             );
//                           }
//                          return const Text("Error");
//                         }),
//                        ),
//           ],
//         ),
//       ),
//     );

//   }
// }