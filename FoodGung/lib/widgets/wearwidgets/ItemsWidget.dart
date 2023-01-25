import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemsWidget extends StatefulWidget {
  final String? id;
  final String? productImage;
  final String? productName;
  final String? productDescription;
  final int? productPrice;
  final Function()? onPressed;
  const ItemsWidget({super.key, 
    this.id,
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
    return SingleChildScrollView(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 7, right: 7, top: 5),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  InkWell(
                    // onTap: widget.onPressed,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        // borderRadius: BorderRadius.circular(20),
                      ),
                      width: double.infinity,
                      height: 120,
                      child: CachedNetworkImage(
                        imageUrl: widget.productImage.toString(),
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width * 0.4,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.productName.toString(),
                      style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF4C53A5),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.productDescription.toString(),
                      style: const TextStyle(fontSize: 6, color: Color(0xFF4C53A5)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.productPrice.toString(),
                          style: const TextStyle(
                              fontSize: 6,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4C53A5)),
                        ),
                        const Icon(
                          Icons.shopping_cart_checkout,
                          color: Color(0xFF4C53A5),
                          size: 17,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
