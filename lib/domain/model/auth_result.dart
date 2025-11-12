import 'package:ecommerce_app/domain/model/user_entity.dart';

class AuthResult{
  final String message ;
  final String token ;

  final UserEntity user;
  AuthResult({required this.message,required this.token,required this.user});
}