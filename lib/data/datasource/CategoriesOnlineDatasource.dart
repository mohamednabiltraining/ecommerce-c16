import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/Category.dart';

abstract class CategoriesOnlineDataSource {
  Future<Result<List<Category>>> getCategories();
}