import 'package:cloud_firestore/cloud_firestore.dart';
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
  Future<UserDto?> getCurrentUser() async {
    try {
      // Kullanıcı mevcut değilse null döndür
      if (FirebaseAuth.instance.currentUser == null) {
        return null;
      }

      // Firestore'dan kullanıcı verilerini al
      final QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore
          .instance
          .collection('users')
          .where('id', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .get();

      // Veri bulunamazsa veya boşsa null döndür
      if (data.docs.isEmpty) {
        return null;
      }

      // Kullanıcı verilerini al ve UserDto'ya dönüştür
      final user = data.docs.first.data();
      return UserDto.fromMap(user);
    } catch (e) {
      // Hata durumunda null döndür
      print('Hata oluştu: $e');
      return null;
    }
  }
}
