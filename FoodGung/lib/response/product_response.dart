import 'package:json_annotation/json_annotation.dart';


import '../models/product.dart';
part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  bool? success;
  //for list response 
  List <Product>? products;

  ProductResponse({this.success,this.products});

  factory ProductResponse.fromJson(Map<String,dynamic> json)=>
    _$ProductResponseFromJson(json);
    Map<String,dynamic> toJson() => _$ProductResponseToJson(this);
}
