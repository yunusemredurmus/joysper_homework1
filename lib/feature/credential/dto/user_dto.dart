// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:joysper_homework1/feature/credential/services/auth_services.dart';
import 'package:joysper_homework1/feature/credential/services/i_auth_service.dart';

class UserDto {
  final String id;
  final String email;
  final String password;

  UserDto({
    required this.id,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'password': password,
    };
  }

  factory UserDto.fromMap(Map<String, dynamic> map) {
    return UserDto(
      id: map['id'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDto.fromJson(String source) =>
      UserDto.fromMap(json.decode(source) as Map<String, dynamic>);

  static IAuthService get _authService => AuthService();

  static Future<UserCredential?> signIn(String email, String password) async {
    return await _authService.signInWithEmailAndPassword(email, password);
  }

  static Future<void> signOut() async {
    await _authService.signOut();
  }

  static Future<UserDto?> getCurrentUser() async {
    return _authService.getCurrentUser();
  }
}
