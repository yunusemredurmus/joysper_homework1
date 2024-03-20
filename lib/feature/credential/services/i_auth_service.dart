import 'package:firebase_auth/firebase_auth.dart';
import 'package:joysper_homework1/feature/credential/dto/user_dto.dart';

abstract class IAuthService {
  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password);
  Future<void> signOut();
  Future<UserDto> getCurrentUser();
}
