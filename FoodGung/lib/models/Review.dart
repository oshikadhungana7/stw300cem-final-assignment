import 'package:new_login/models/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Review.g.dart';

@JsonSerializable()
class Review{
  @JsonKey(name: "_id")
  String? id;
  String? user;
  String? name;
  int? rating;
  String? comment;

  Review({
    this.id,
    this.user,
    this.name,
    this.rating,
    this.comment
  });
  factory Review.fromJson(Map<String,dynamic> json)=> _$ReviewFromJson(json);
  Map<String,dynamic> toJson() => _$ReviewToJson(this);
}
