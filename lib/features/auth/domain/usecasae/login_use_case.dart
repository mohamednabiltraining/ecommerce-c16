import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/auth/domain/auth_repository/auth_repository.dart';
import 'package:ecommerce_app/features/auth/domain/entities/auth_result.dart';

class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  Future<Either<Failure, AuthResult>> call(
    String email,
    String password,
  ) async {
    if (email.isEmpty || !email.contains('@')) {
      return Left(ValidationError('Invalid email address'));
    }
    return await _repository.login(email, password);
  }
}
