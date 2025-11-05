import 'package:ecommerce_app/domain/model/Brand.dart';

abstract class BrandsRepo{
  // abstract functions only
  Future<List<Brand>> getBrands();
}