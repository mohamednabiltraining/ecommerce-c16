import 'package:ecommerce_app/data/datasource/ProductsOnlineDataSource.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/product.dart';
import 'package:ecommerce_app/domain/repos/ProductsRepo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRepo)
class ProductsRepoImpl implements ProductsRepo{
  ProductsOnlineDataSource onlineDataSource;

  ProductsRepoImpl(this.onlineDataSource);

  @override
  Future<Result<List<Product>>> getProducts({int limit = 20, int page = 1, String? keyword, String? brand, List<String>? categoryIn, String? subcategory, String? sort}) {
    return onlineDataSource.getProducts(
    limit: limit,
      sort: sort,
      page: page,
      keyword: keyword,
      brand: brand,
      categoryIn: categoryIn,
      subcategory: subcategory,
    );
  }

}