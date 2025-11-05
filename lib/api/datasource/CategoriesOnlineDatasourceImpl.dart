import 'package:ecommerce_app/api/ApiManager.dart';
import 'package:ecommerce_app/data/datasource/CategoriesOnlineDatasource.dart';
import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesOnlineDataSource)
class CategoriesOnlineDataSourceImpl implements CategoriesOnlineDataSource{
  ApiManager apiManager;
  CategoriesOnlineDataSourceImpl(this.apiManager);
  @override
  Future<List<Category>> getCategories()async{
    var response =  await apiManager.getCategories();
    return response.data?.map((catDto) => catDto.toCategory(),).toList() ?? [];
  }
}