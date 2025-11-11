import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../models/login_response.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;
  AuthRemoteDataSourceImpl()
    : dio = Dio(
        BaseOptions(
          baseUrl: 'https://ecommerce.routemisr.com/api/v1/',
          connectTimeout: Duration(seconds: 30),
          receiveTimeout: Duration(seconds: 30),
        ),
      )..interceptors.add(PrettyDioLogger(
    requestBody: true,
    error: true,
    responseBody: true
  ));

  @override
  Future<LoginResponse> login(String email, String password) async {
    try {
      final response = await dio.post(
        'auth/signin',
        data: {"email": email, "password": password},
      );
      if (response.statusCode == 200) {
        return LoginResponse.fromJson(response.data);
      } else {
        throw Exception('Login failed with states code ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw Exception('no internet connection');
      } else if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('no internet connection');
      } else if (e.response != null) {
        throw Exception(e.response?.data['message'] ?? 'Login Failed ');
      } else {
        throw Exception('Something went wrong');
      }
    }
  }
}
