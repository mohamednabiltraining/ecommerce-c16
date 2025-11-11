import 'package:ecommerce_app/features/auth/domain/entities/user_entity.dart';

class AuthResult{
  final String message ;
  final String token ;

  final UserEntity user;
  AuthResult({required this.message,required this.token,required this.user});
}