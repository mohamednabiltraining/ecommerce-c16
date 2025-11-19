import 'package:dio/dio.dart';
import 'package:ecommerce_app/api/model/response/BrandsResponse.dart';
import 'package:ecommerce_app/api/model/response/CategoriesResponse.dart';
import 'package:ecommerce_app/api/model/response/ProductsResponse.dart';
import 'package:ecommerce_app/api/model/response/login_response.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@singleton
class ApiManager{
  final _dio = Dio();

  ApiManager(){
    _dio.options.baseUrl = "https://ecommerce.routemisr.com/api/";
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90
    ));

  }
  
  Future<CategoriesResponse> getCategories()async{
    var response = await _dio.get("v1/categories");
    var categoriesResponse = CategoriesResponse.fromJson(response.data);
    return categoriesResponse;
  }
  Future<BrandsResponse> getBrands()async{
    var response = await _dio.get("v1/brands");
    var brandsResponse = BrandsResponse.fromJson(response.data);
    return brandsResponse;
  }

  Future<LoginResponse> login(String email , String password)async{

      final response = await _dio.post('v1/auth/signin',
        data: {"email": email, "password": password},
      );
      return LoginResponse.fromJson(response.data);
  }

  Future<ProductsResponse> getProducts({
    int? limit,
    int? page,
    String? keyword,
    String? brand,
    List<String>? categoryIn,
    String? subcategory,
    String? sort,
  }) async {
    Map<String, dynamic> queryParameters = {};

    if (limit != null) queryParameters['limit'] = limit;
     if (page != null) queryParameters['page'] = page;
    if (keyword != null) queryParameters['keyword'] = keyword;
    if (brand != null) queryParameters['brand'] = brand;
    if (categoryIn != null && categoryIn.isNotEmpty) {
      queryParameters['category[in]'] = categoryIn;
    }
    if (subcategory != null) queryParameters['subcategory'] = subcategory;
    if (sort != null) queryParameters['sort'] = sort;

    final response = await _dio.get(
      'v1/products',
      queryParameters: queryParameters,
    );

    return ProductsResponse.fromJson(response.data);
  }
}