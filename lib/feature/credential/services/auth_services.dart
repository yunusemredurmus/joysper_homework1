import 'package:firebase_auth/firebase_auth.dart';
import 'package:joysper_homework1/feature/credential/dto/user_dto.dart';
import 'package:joysper_homework1/feature/credential/services/i_auth_service.dart';

class AuthService implements IAuthService {
  @override
  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<UserDto> getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    return UserDto(id: user!.uid, email: user.email!, password: '');
  }
}
