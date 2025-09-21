import 'package:flutter/material.dart';
import 'package:habitoo_flutter/src/features/auth/presentation/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Login Page'),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
              child: const Text('Entrar'),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, RegisterPage.route),
              child: const Text('Criar conta'),
            ),
          ],
        ),
      ),
    );
  }
}
