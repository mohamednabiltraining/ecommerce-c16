import 'package:ecommerce_app/api/ApiManager.dart';
import 'package:ecommerce_app/api/execute_api.dart';
import 'package:ecommerce_app/data/datasource/ProductsOnlineDataSource.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/product.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsOnlineDataSource)
class ProductsOnlineDataSourceImpl implements ProductsOnlineDataSource{
  ApiManager apiManager;
  ProductsOnlineDataSourceImpl(this.apiManager);
  @override
  Future<Result<List<Product>>> getProducts({int limit = 20, int page = 1, String? keyword, String? brand, List<String>? categoryIn, String? subcategory, String? sort}) {
    return executeApi(()async{
      var response = await apiManager.getProducts(page: page, limit: limit, keyword: keyword, brand: brand, categoryIn: categoryIn,
          subcategory: subcategory, sort: sort);
      return response.data?.map((productDto)=> productDto.toProduct(),).toList()??[];
    },);
  }
}