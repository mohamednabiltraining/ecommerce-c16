import 'package:ecommerce_app/api/ApiManager.dart';
import 'package:ecommerce_app/api/execute_api.dart';
import 'package:ecommerce_app/data/datasource/BrandsOnlineDataSource.dart';
import 'package:ecommerce_app/data/datasource/CategoriesOnlineDatasource.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/Brand.dart';
import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsOnlineDataSource)
class BrandsDataSourceImpl implements BrandsOnlineDataSource{
  ApiManager apiManager;
  BrandsDataSourceImpl(this.apiManager);
  @override
  Future<Result<List<Brand>>> getBrands()async{
    return executeApi(()async{
      var response =  await apiManager.getBrands();
      var data =  response.data?.map((brandDto) => brandDto.toBrand(),).toList() ?? [];
      return data;
    },);
  }
}