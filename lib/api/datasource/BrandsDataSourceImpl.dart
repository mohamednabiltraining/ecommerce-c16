import 'package:ecommerce_app/api/ApiManager.dart';
import 'package:ecommerce_app/data/datasource/BrandsOnlineDataSource.dart';
import 'package:ecommerce_app/data/datasource/CategoriesOnlineDatasource.dart';
import 'package:ecommerce_app/domain/model/Brand.dart';
import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsOnlineDataSource)
class BrandsDataSourceImpl implements BrandsOnlineDataSource{
  ApiManager apiManager;
  BrandsDataSourceImpl(this.apiManager);
  @override
  Future<List<Brand>> getBrands()async{
    var response =  await apiManager.getBrands();
    return response.data?.map((brandDto) => brandDto.toBrand(),).toList() ?? [];
  }
}