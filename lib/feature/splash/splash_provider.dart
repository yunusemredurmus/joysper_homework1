import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:joysper_homework1/core/utils/app_user_manager.dart';
import 'package:joysper_homework1/core/utils/base_provider.dart';
import 'package:joysper_homework1/feature/credential/dto/user_dto.dart';

class SplashProvider extends BaseProvider {
  bool isFirst = true;
  bool isCurrentUser = true;
  Future<void> init(BuildContext context) async {
    if (!isFirst) return;

    await Future.delayed(const Duration(seconds: 2));
    try {
      AppUserManager().user = await UserDto.getCurrentUser();
      if (AppUserManager().user != null) {
        isCurrentUser = true;
        notifyListeners();

        //ignore: use_build_context_synchronously
        context.go("navbar");
      }
    } finally {
      isFirst = false;
      isCurrentUser = false;
      notifyListeners();
    }
  }
}
