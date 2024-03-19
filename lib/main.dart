import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:joysper_homework1/feature/home/screens/home_screen.dart';
import 'package:joysper_homework1/feature/home/screens/register_screen.dart';
import 'package:joysper_homework1/feature/splash/screens/splash_screen.dart';
import 'package:joysper_homework1/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
