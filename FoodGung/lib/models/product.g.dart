// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      price: json['price'] as int?,
      rating: json['rating'] as int?,
      numOfReviews: json['numOfReviews'] as int?,
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      category: json['category'] as String?,
    )..description = json['description'] as String?;

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'rating': instance.rating,
      'description': instance.description,
      'numOfReviews': instance.numOfReviews,
      'reviews': instance.reviews,
      'images': instance.images,
      'category': instance.category,
    };
