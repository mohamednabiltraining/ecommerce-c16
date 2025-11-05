import 'package:ecommerce_app/domain/model/Category.dart';

abstract class CategoriesOnlineDataSource {
  Future<List<Category>> getCategories();
}