import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/Brand.dart';

abstract class BrandsOnlineDataSource{
  Future<Result<List<Brand>>> getBrands();
}