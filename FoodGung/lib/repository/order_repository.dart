import 'package:new_login/api/Order_api.dart';
import 'package:new_login/response/order_response.dart';

class OrderRepository{
  Future<OrderResponse> getOrderHistory() async{
    return OrderAPI().getOrderHistory();
  }
}