import 'package:ecommerce_app/domain/model/Category.dart';

abstract class CategoriesRepo{
  // abstract functions only
  Future<List<Category>> getCategories();
}

// domain is a separate layer
// preferred to contain pure classes

// dependancy