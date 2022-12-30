import 'package:clippy_flutter/arc.dart';
import 'package:flutter/material.dart';
import '../../models/Review.dart';
import '../../widgets/ItemAppBar.dart';
import '../../widgets/ItemBottomNavBar.dart';


class ItemPage extends StatefulWidget {

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
 
  @override
  Widget build(BuildContext context) {
      final args = ModalRoute.of(context)!.settings.arguments as Map;

     String id = args['id'];
     print(id);

     var name = args['name'];
     var image=args['image'];
    //  print(image);
     var price = args['price'];
     var description = args['description'];
     var review  = args['review'];
     print(review.length);
     for(int i=0;i<review.length;i++){
      print(review[i].name);
     }

   
    return Scaffold(
        backgroundColor: Color(0xFFEDECF2),
        body: ListView(
          children: [
            ItemAppBar(),
            Padding(padding: EdgeInsets.all(16),
            child: Image.network("${image}", height: 300,),
            ),
            Arc(
              edge: Edge.TOP,
              arcType: ArcType.CONVEY,
              height: 30,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal:20),
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 50,bottom: 20),
                      child: Row(
                        children: [
                          Text(
                            "${name}",
                            style: TextStyle(
                              fontSize: 28,
                              color: Color(0xFF4C53A5),
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                      ),
                     
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(       
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text("Product Description: ${description}",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4C53A5)
                            ),),
                            ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Row(children: [
                            Text(
                              "Price: Rs ${ price}",
                              style: TextStyle(fontSize: 18,color: Color(0xFF4C53A5),
                              fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10,)
                        ],)
                        )
                      
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
              ElevatedButton.icon(
              key: const ValueKey('submitReview'),
              onPressed: (){
                Navigator.pushNamed(context, '/viewreview',arguments: review);
              }, 
              icon: Icon(Icons.view_array),
              label: Text(
                "View Review",
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
    bottomNavigationBar: ItemBottomNavBar(),
    );
  }
}

