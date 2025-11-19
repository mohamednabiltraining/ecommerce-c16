import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/product.dart';

abstract class ProductsRepo{
  Future<Result<List<Product>>> getProducts({
    int limit = 20,
    int page = 1,
    String? keyword,
    String? brand,
    List<String>? categoryIn,
    String? subcategory,
    String? sort,
  });
}