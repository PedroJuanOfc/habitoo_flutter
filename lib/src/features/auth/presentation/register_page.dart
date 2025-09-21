import 'package:flutter/material.dart';

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
              onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
              child: const Text('Registrar (placeholder)'),
            ),
          ],
        ),
      ),
    );
  }
}
