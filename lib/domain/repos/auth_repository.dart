import 'package:ecommerce_app/domain/api_result.dart';
import '../model/auth_result.dart';

abstract class AuthRepository {
  Future<Result<AuthResult>> login(String email, String password);
}


