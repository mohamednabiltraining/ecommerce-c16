import 'package:ecommerce_app/data/datasource/CategoriesOnlineDatasource.dart';
import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:ecommerce_app/domain/repos/CategoriesRepo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesRepo)
class CategoriesRepoImpl implements CategoriesRepo{
  CategoriesOnlineDataSource onLineDataSource;
  CategoriesRepoImpl(this.onLineDataSource);// DI
  @override
  Future<List<Category>> getCategories() {
    // real implementation of abstract function of categories repo
    return onLineDataSource.getCategories();
  }
}