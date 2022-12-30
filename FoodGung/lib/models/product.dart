import 'package:json_annotation/json_annotation.dart';
import 'package:new_login/models/Review.dart';

import 'Image.dart';

part 'product.g.dart';

@JsonSerializable()

class Product {
  @JsonKey(name:"_id")
  String? id;
  String? name;
  int? price;
  int? rating; 
  String? description;
  int? numOfReviews;
  List<Review>? reviews;
  List<Image>? images;
  String? category;


  Product({
    this.id,
    this.name,

    this.price,
    this.rating,
    this.numOfReviews,
    this.reviews,
    this.images,
    this.category,

  });  
  factory Product.fromJson(Map<String,dynamic> json)=> _$ProductFromJson(json);
  Map<String,dynamic> toJson() => _$ProductToJson(this);
}

