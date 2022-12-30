import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemsWidget extends StatefulWidget {
  final String? id;
   final String? productImage;
  final String? productName;
  final String? productDescription;
  final int? productPrice;
  final Function()? onPressed;
  ItemsWidget({
    this. id,
    this.productImage,
    this.productName,
    this.productDescription,
    this.productPrice,
    this.onPressed,
  });

  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15,right: 15,top: 10),
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                InkWell(
                  onTap:widget.onPressed,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: CachedNetworkImage(imageUrl: widget.productImage.toString(),
                      height: 120,
                      width: 120,),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.productName.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF4C53A5),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
               Container(
                alignment: Alignment.centerLeft,
                child: Text(
                widget.productDescription.toString(),
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF4C53A5)
                ),
               ),
               ),
                Padding(
            padding: EdgeInsets.symmetric(vertical:10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.productPrice.toString(),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5)
                ),),
                Icon(
                  Icons.shopping_cart_checkout,
                  color: Color(0xFF4C53A5),
                )
              ],
            ),
          
          )
              ],
            ),
          ),
         
        ],
        );
        
  }
}