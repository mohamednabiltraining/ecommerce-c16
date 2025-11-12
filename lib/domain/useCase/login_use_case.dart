import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/repos/auth_repository.dart';
import 'package:ecommerce_app/domain/model/auth_result.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  Future<Result<AuthResult>> call(
    String email,
    String password,
  ) {
    return _repository.login(email, password);
  }
}
