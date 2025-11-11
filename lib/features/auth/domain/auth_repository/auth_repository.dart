import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/auth_result.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResult>> login(String email, String password);
}


