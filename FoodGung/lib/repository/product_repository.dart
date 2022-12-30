
import 'package:new_login/api/Product_api.dart';
import 'package:new_login/response/product_response.dart';

class ProductRepository{
  Future <ProductResponse?> showFilteredProduct( String? keyword) async{
    return ProductAPI().getProductsByFilter(keyword);
  }
}

