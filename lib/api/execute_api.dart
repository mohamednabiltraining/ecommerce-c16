
import 'package:dio/dio.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/exceptions/exceptions.dart';

Future<Result<T>> executeApi<T>(Future<T> apiCall() )async{

  try {
    final response = await apiCall();
    return Success(response);
    // if (response.statusCode == 200) {
    //
    // } else {
    //   return Failure(Exception('Login failed with states code ${response.statusCode}'));
    // }
  } on DioException catch (e) {
    switch(e.type){
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:{
        return Failure(NoInternetException(message: 'no internet connection')) ;
      }
      default : {
        // server responded
        if (e.response != null) {
          return Failure(ServerError(
              message: e.response?.data['message'],
          statusMsg: e.response?.data['statusMsg']
          ));
        }
        return Failure(Exception('Something went wrong'));
      }
    }
  }

}