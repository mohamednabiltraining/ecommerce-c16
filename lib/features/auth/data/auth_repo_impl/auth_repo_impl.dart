import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/domain/auth_repository/auth_repository.dart';
import 'package:ecommerce_app/features/auth/domain/entities/auth_result.dart';

class AuthRepoImpl implements AuthRepository{

  ///
  ///
  final AuthRemoteDataSource _remoteDataSource ;

  AuthRepoImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, AuthResult>> login(String email, String password)async {
    try{
      final result =  await _remoteDataSource.login(email, password);

      return Right(result.toEntity());
    }catch(e){
      return Left(Failure(e.toString()));
    }
  }

}