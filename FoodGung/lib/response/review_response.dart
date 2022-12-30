import 'package:json_annotation/json_annotation.dart';

import '../models/Review.dart';

part 'review_response.g.dart';


@JsonSerializable()
class ReviewResponse {
  bool? success;
  List<Review>? reviews;
  ReviewResponse({this.success,this.reviews});

  factory ReviewResponse.fromJson(Map<String,dynamic> json)=>
    _$ReviewResponseFromJson(json);
    Map<String,dynamic> toJson() => _$ReviewResponseToJson(this);
}