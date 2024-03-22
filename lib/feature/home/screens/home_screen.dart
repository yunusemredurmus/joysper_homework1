import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:joysper_homework1/core/utils/app_user_manager.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text("Merhaba ${AppUserManager().user?.email }"),
            ],
          ),
          const Center(
            child: Text("Home Body"),
          ),
          const SizedBox.shrink(),
        ],
      ),
    );
  }
}
