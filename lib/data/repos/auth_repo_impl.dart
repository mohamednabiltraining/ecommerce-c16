import 'package:ecommerce_app/data/datasource/auth_remote_data_source.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/repos/auth_repository.dart';
import 'package:ecommerce_app/domain/model/auth_result.dart';
import 'package:injectable/injectable.dart';


@Injectable(as:AuthRepository )
class AuthRepoImpl implements AuthRepository{

  ///
  ///
  final AuthRemoteDataSource _remoteDataSource ;

  AuthRepoImpl(this._remoteDataSource);
  @override
  Future<Result<AuthResult>> login(String email, String password)async {
      final result =  await _remoteDataSource.login(email, password);
      return result;
  }

}