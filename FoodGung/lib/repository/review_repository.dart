import 'package:new_login/api/review_api.dart';
import 'package:new_login/response/review_response.dart';

class ReviewRepository{
  Future <bool> addReview(String id, int rating, String comment) async{
    return ReviewApi().addReview(id,rating,comment);
  }
  Future <ReviewResponse> getReview(String id) async{
    return ReviewApi().getReviews(id);
  }
}