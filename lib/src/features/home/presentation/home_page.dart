import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Habitoo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Olá', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            Text('Habitos', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Novo hábito...',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: const Icon(Icons.add),
                  tooltip: 'Adicionar',
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Nenhum hábito ainda.\nComece criando um hábito acima. Você poderá editar depois.',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
