import 'package:ecommerce_app/api/ApiManager.dart';
import 'package:ecommerce_app/api/execute_api.dart';
import 'package:ecommerce_app/data/datasource/auth_remote_data_source.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/auth_result.dart';
import 'package:injectable/injectable.dart';
import '../model/response/login_response.dart';


@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;
  AuthRemoteDataSourceImpl(this.apiManager);

  @override
  Future<Result<AuthResult>> login(String email, String password) async {
    return executeApi(()async{
      var response = await apiManager.login(email, password);
      return response.toEntity();
    },);
  }
}
