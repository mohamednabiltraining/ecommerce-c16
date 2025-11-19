import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/SortBy.dart';
import 'package:ecommerce_app/domain/model/product.dart';
import 'package:ecommerce_app/domain/repos/ProductsRepo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsUseCase{
  ProductsRepo repo;

  GetProductsUseCase(this.repo);
  Future<Result<List<Product>>> getProducts({
    int limit = 20,
    int page = 1,
    String? keyword,
    String? brand,
    List<String>? categoryIn,
    String? subcategory,
    SortBy? sort,
  }){
    return repo.getProducts(
      limit: limit,
      page: page,
      keyword: keyword,
      brand: brand,
      categoryIn: categoryIn,
      subcategory: subcategory,
      sort: sort?.value
    );

  }
}