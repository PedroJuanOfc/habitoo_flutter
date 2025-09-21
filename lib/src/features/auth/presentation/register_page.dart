import 'package:flutter/material.dart';
import 'package:habitoo_flutter/src/features/auth/presentation/login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const route = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Register Page'),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context,
                LoginPage.route,
                (route) => false,
              ),
              child: const Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
