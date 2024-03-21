import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:joysper_homework1/core/utils/app_user_manager.dart';
import 'package:joysper_homework1/core/utils/base_provider.dart';
import 'package:joysper_homework1/feature/credential/dto/user_dto.dart';

class CredentialProvider extends BaseProvider {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  void login(BuildContext context) async {
    final email = loginEmailController.text;
    final password = loginPasswordController.text;
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email and Password cannot be empty'),
        ),
      );
      setLoading(true);
    }

    try {
      final UserCredential? userCredential =
          await UserDto.signIn(email, password);
      if (userCredential != null) {
        AppUserManager().user = await UserDto.getCurrentUser();
        // ignore: use_build_context_synchronously
        context.go('/home');
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    } finally {
      setLoading(false);
    }
  }
}
