import 'package:ecommerce_app/api/ApiManager.dart';
import 'package:ecommerce_app/api/execute_api.dart';
import 'package:ecommerce_app/data/datasource/CategoriesOnlineDatasource.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesOnlineDataSource)
class CategoriesOnlineDataSourceImpl implements CategoriesOnlineDataSource{
  ApiManager apiManager;
  CategoriesOnlineDataSourceImpl(this.apiManager);
  @override
  Future<Result<List<Category>>> getCategories()async{
    return executeApi(()async{
      var response =  await apiManager.getCategories();
      var data =  response.data?.map((catDto) => catDto.toCategory(),).toList() ?? [];
      return data;
    },);
  }
}