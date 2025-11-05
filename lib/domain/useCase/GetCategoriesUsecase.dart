import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:ecommerce_app/domain/repos/CategoriesRepo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUseCase {
  CategoriesRepo categoriesRepo;
  GetCategoriesUseCase(this.categoriesRepo);
  Future<List<Category>> getCategories(){
    // handle business logic
    return categoriesRepo.getCategories();
  }
}