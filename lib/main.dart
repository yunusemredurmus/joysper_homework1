import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:joysper_homework1/feature/credential/provider/credential.provider.dart';
import 'package:joysper_homework1/feature/home/login_screen.dart';
import 'package:joysper_homework1/feature/home/screens/home_screen.dart';
import 'package:joysper_homework1/feature/splash/provider/splash_provider.dart';
import 'package:joysper_homework1/feature/splash/screens/splash_screen.dart';
import 'package:joysper_homework1/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MyAppRouts {
  GoRouter route = GoRouter(
    routes: [
      GoRoute(
        name: 'SplashScreen',
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: SplashScreen());
        },
        routes: [
          GoRoute(
            name: 'home',
            path: 'home',
            pageBuilder: (context, state) {
              return const MaterialPage(child: HomeScreen());
            },
          ),
          GoRoute(
            name: 'login',
            path: 'login',
            pageBuilder: (context, state) {
              return const MaterialPage(child: LoginScreen());
            },
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(child: Text("Error"));
    },
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => CredentialProvider()),
        // Diğer providerlar buraya eklenebilir
      ],
      child: MaterialApp.router(
        routerConfig: MyAppRouts().route,
      ),
    );
  }
}
