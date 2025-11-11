import 'package:ecommerce_app/features/auth/domain/entities/auth_result.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user_entity.dart';

class LoginResponse {
  LoginResponse({this.message, this.user, this.token});

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  User? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

  AuthResult toEntity() {
    return AuthResult(
      message: message ?? '',
      token: token ?? '',
      user: user?.toEntity() ?? UserEntity(email: '', role: '', name: ''),
    );
  }
}

class User {
  User({this.name, this.email, this.role});

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  String? name;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }

  UserEntity toEntity() {
    return UserEntity(email: email ?? '', role: role ?? '', name: name ?? '');
  }
}
