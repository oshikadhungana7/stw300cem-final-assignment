// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      id: json['_id'] as String?,
      user: json['user'] as String?,
      name: json['name'] as String?,
      rating: json['rating'] as int?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'name': instance.name,
      'rating': instance.rating,
      'comment': instance.comment,
    };
