// import 'package:flutter/material.dart';


// class ReviewCard extends StatefulWidget {
//   const ReviewCard({Key? key}) : super(key: key);

//   @override
//   State<ReviewCard> createState() => _ReviewCardState();
// }

// class _ReviewCardState extends State<ReviewCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Expanded(
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
//                           Center(child: Text("Reviews",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
                        
//                         ],
//                       ),
//                         Row(
//                           children: [
//                             Text("Price:",style: TextStyle(fontWeight: FontWeight.bold),),
//                             SizedBox(width: 20,),
//                             Text("Rs",style:TextStyle(fontWeight: FontWeight.bold)),
//                             Text(" da"),
//                           ],
//                         ),
//                         Text("Description:",style: TextStyle(fontWeight: FontWeight.bold),),
//                         Center(child: Text(" dad")),
                    
//                       Container(
//                             child: ListView.builder(
//                               shrinkWrap: true,
//                               itemCount:2,
//                               itemBuilder: (BuildContext context,index){
//                                   return ReviewCard(
                                    
//                                   );
                                  
//                               },
                              
//                               ),
//                           ),
                          
//                           Center(
//                             child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
//                               primary: Color.fromARGB(255, 167, 103, 103)
//                             ), child: Padding(padding: EdgeInsets.all(16.0),child: Text("Submit Review",style: TextStyle(fontSize: 20),),
//                             )),
//                           ),
//                           // ElevatedButton(onPressed: (){Navigator.pushNamed(context, '/review');}, child: Text("Review"))
//                     ],
//                   ),
//                 ),
                  
//                 ),
//               ),
//     );
//   }
// }