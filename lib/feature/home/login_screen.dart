import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:joysper_homework1/feature/credential/provider/credential.provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Consumer<CredentialProvider>(
            builder: (context, provider, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    Text(
                      "Giriş Yap",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      "E-posta adresini gir",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: provider.loginEmailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "E-posta adresi",
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: provider.loginPasswordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Şifre"),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 40),
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    provider.login(context);
                  },
                  child: const Text(
                    "Giriş Yap",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
