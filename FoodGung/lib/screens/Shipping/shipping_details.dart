
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';

// import '../../models/shipping_model.dart';

// class ShippingDetail extends StatefulWidget {
//  const ShippingDetail({Key? key}) : super(key: key);

//   @override
//   State<ShippingDetail> createState() => _ShippingDetailsState();
// }

// class _ShippingDetailsState extends State<ShippingDetail> {
//     GlobalKey<FormState> formkey = GlobalKey<FormState>();
//     void validate(){
//       if(formkey.currentState!.validate()){
//         AwesomeNotifications().createNotification(
//           content: NotificationContent(
//               channelKey: 'basic_channel',
//               title: 'Getstarted',
//               body: "Shipping Data Saved Successfully",
//               id: 1));
//         Navigator.pushNamed(context, '/confirmOrder');  
//       }
//       else{
//         print("Not Validate");
//       }
//     }
//     final address = TextEditingController();
//     var city = TextEditingController();
//     var pincode = TextEditingController();
//     var phone = TextEditingController();
//     var country = TextEditingController();
//     var state = TextEditingController();
//   @override
//   //   void initState() {
//   //   super.initState();
//   //   ShippingModel shippingData = ShippingModel();
//   //   var address=shippingData.getAllData().then((value) => print(value.address));
//   // }
//   Widget build(BuildContext context) {
//       return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("Shipping Details"),
//         backgroundColor: const Color(0xFF4C53A5),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(vertical: 20),
//         child: Form(
//           key: formkey,
//           child: Column(
//             children: [
//               const SizedBox(height: 20),
//               Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                     child: Container(
//                       child: Column(
//                         mainAxisAlignment:MainAxisAlignment.center,
//                         children: [
//                           TextFormField(
//                             key:const ValueKey('address'),
//                             onChanged: (value){},
//                             controller: address,
//                             decoration: const InputDecoration(
//                               border: OutlineInputBorder(),
//                               fillColor: Colors.grey,
//                               focusColor: Colors.grey,
//                               prefixIcon: Padding(
//                                 padding:  EdgeInsets.all(0.0),
//                                 child: Icon(
//                                 Icons.home,
//                                 color: Colors.black,
//                                 size: 30,
//                           ),
//                               ),
//                               hintText: 'Address',
//                               hintStyle: TextStyle(fontSize: 18.0)
                             
//                             ),
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return 'Please enter your address';
//                       }
//                       return null;
//               },
//             ),
//             const SizedBox(height: 10,),
//              TextFormField(
//                     key:const ValueKey('city'),
//                     onChanged: (value){},
//                     controller: city,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       fillColor: Colors.grey,
//                       focusColor: Colors.grey,
//                       prefixIcon: Padding(
//                         padding:  EdgeInsets.all(0.0),
//                         child: Icon(
//                         Icons.account_balance_outlined,
//                         color: Colors.black,
//                         size: 30,
//                   ),
//                       ),
//                       hintText: 'City',
//                       hintStyle: TextStyle(fontSize: 18.0)
//                     ),
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please enter your city';
//               }
//               return null;
//             },
//             ),
//             const SizedBox(height: 10,),
//              TextFormField(
//                     key:const ValueKey('pincode'),
//                     onChanged: (value){},
//                     controller: pincode,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       fillColor: Colors.grey,
//                       focusColor: Colors.grey,
//                         prefixIcon: Padding(
//                         padding:  EdgeInsets.all(0.0),
//                         child: Icon(
//                         Icons.pin_drop_sharp,
//                         color: Colors.black,
//                         size: 30,
//                   ),
//                       ),
//                         hintText: 'Pincode',
//                       hintStyle: TextStyle(fontSize: 18.0)
//                     ),
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please enter your pincode';
//               }
//               return null;
//               },
//             ),
//             const SizedBox(height: 10,),
//              TextFormField(
//                     key:const ValueKey('phone'),
//                     onChanged: (value){},
//                     controller: phone,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       fillColor: Colors.grey,
//                       focusColor: Colors.grey,
//                         prefixIcon: Padding(
//                         padding:  EdgeInsets.all(0.0),
//                         child: Icon(
//                         Icons.add_call ,
//                         color: Colors.black,
//                         size: 30,
//                   ),
//                       ),
//                       hintText: 'Phone',
//                       hintStyle: TextStyle(fontSize: 18.0)
//                     ),
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please enter your phone';
//               }
//               return null;
//               },
//             ),
//             const SizedBox(height: 10,),
//              TextFormField(
//                     key:const ValueKey('country'),
//                     onChanged: (value){},
//                     controller: country,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       fillColor: Colors.grey,
//                       focusColor: Colors.grey,
//                       prefixIcon: Padding(
//                         padding:  EdgeInsets.all(0.0),
//                         child: Icon(
//                         Icons.language_outlined ,
//                         color: Colors.black,
//                         size: 30,
//                   ),
//                       ),
//                       hintText: 'Country',
//                       hintStyle: TextStyle(fontSize: 18.0)
//                     ),
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please enter your country';
//               }
//               return null;
//               },
//             ),
//             const SizedBox(height: 10,),
//              TextFormField(
//                     key:const ValueKey('state'),
//                     onChanged: (value){},
//                     controller: state,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       fillColor: Colors.grey,
//                       focusColor: Colors.grey,
//                         prefixIcon: Padding(
//                         padding:  EdgeInsets.all(0.0),
//                         child: Icon(
//                         Icons.local_shipping_rounded,
//                         color: Colors.black,
//                         size: 30,
//                   ),
//                       ),
//                       hintText: 'State',
//                       hintStyle: TextStyle(fontSize: 18.0)
//                     ),
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please enter your state';
//               }
//               return null;
//               },
//             ),
        
//             const SizedBox(height: 10,),
//               ElevatedButton.icon(
//                 key:const ValueKey('btnShipping'),
//                 onPressed: (){
//                   ShippingModel shippingData = ShippingModel(
//                         address: address.text,
//                         city: city.text,
//                         pincode: pincode.text,
//                         phone: phone.text,
//                         country: country.text,
//                         state: state.text
//                       );
//                   shippingData.setAllData(shippingData);
//                   validate();
                 
//                   // Navigator.pushNamed(context, '/confirmOrder');            
//                 }, 
                
//                 icon: const Icon(Icons.confirmation_number),
//                 label: const Text(
//                   "Confirm Order",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold
//                   ),
//                 ),
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(const Color(0xFF4C53A5)),
//                   padding: MaterialStateProperty.all(
//                     const EdgeInsets.symmetric(vertical: 13,horizontal: 15)
//                   ),
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30)
//                     )
//                   )
                    
//                  ),
//                 )
//                         ],
//                       ),
                      
//                     )
                    
//                     )
//                     ],
//                      )
//                      ],
//                     ),
//         ),
//                    ),
                        
//     );
//   }
// }