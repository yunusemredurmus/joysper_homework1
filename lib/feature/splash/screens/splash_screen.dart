import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:joysper_homework1/feature/splash/provider/splash_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      context.read<SplashProvider>().init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logo'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox.shrink(),
            const Center(
              child: Text("Onboarding Ekranı"),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/login');
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
