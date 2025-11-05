import 'package:ecommerce_app/domain/model/Brand.dart';

abstract class BrandsOnlineDataSource{
  Future<List<Brand>> getBrands();
}