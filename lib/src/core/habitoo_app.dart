import 'package:flutter/material.dart';
import 'package:habitoo_flutter/src/features/auth/presentation/login_page.dart';
import 'package:habitoo_flutter/src/features/auth/presentation/register_page.dart';
import 'package:habitoo_flutter/src/features/home/presentation/home_page.dart';

class HabitooApp extends StatelessWidget {
  const HabitooApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF6750A4),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      initialRoute: LoginPage.route,
      routes: {
        LoginPage.route: (_) => const LoginPage(),
        RegisterPage.route: (_) => const RegisterPage(),
        HomePage.route: (_) => const HomePage(),
      },
    );
  }
}
