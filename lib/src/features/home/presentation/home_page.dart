import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _habitCtrl = TextEditingController();
  final List<String> _habits = [];

  @override
  void dispose() {
    _habitCtrl.dispose();
    super.dispose();
  }

  void _addHabit() {
    final text = _habitCtrl.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _habits.add(text);
    });
    _habitCtrl.clear();
  }

  void _onHabitTap(int index) async {
    final current = _habits[index];
    final edited = await _promptEditHabit(current);
    if (edited != null && edited.isNotEmpty && edited != current) {
      setState(() {
        _habits[index] = edited;
      });
    }
  }

  Future<String?> _promptEditHabit(String initial) async {
    final ctrl = TextEditingController(text: initial);
    return showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Editar hábito'),
        content: TextField(
          controller: ctrl,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Descreva o hábito...',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, ctrl.text.trim()),
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }

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
              controller: _habitCtrl,
              onSubmitted: (_) => _addHabit(),
              decoration: InputDecoration(
                hintText: 'Novo hábito...',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: _addHabit,
                  icon: const Icon(Icons.add),
                  tooltip: 'Adicionar',
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back,
                  size: 14,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    'Dica: arraste para a esquerda para excluir • Toque no hábito para editar',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: _habits.isEmpty
                  ? Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Nenhum hábito ainda.\nComece criando um hábito acima. Você poderá editar depois.',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    )
                  : ListView.separated(
                      itemCount: _habits.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final h = _habits[index];
                        return Dismissible(
                          key: ValueKey('habit_$index'),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            final removed = _habits[index];
                            final removedIndex = index;

                            setState(() {
                              _habits.removeAt(removedIndex);
                            });

                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                SnackBar(
                                  content: Text('Hábito removido: $removed'),
                                  action: SnackBarAction(
                                    label: 'Desfazer',
                                    onPressed: () {
                                      setState(() {
                                        _habits.insert(removedIndex, removed);
                                      });
                                    },
                                  ),
                                  duration: const Duration(seconds: 4),
                                ),
                              );
                          },
                          background: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            color: Theme.of(context).colorScheme.errorContainer,
                            child: Icon(
                              Icons.delete,
                              color: Theme.of(
                                context,
                              ).colorScheme.onErrorContainer,
                            ),
                          ),
                          secondaryBackground: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            color: Theme.of(context).colorScheme.errorContainer,
                            child: Icon(
                              Icons.delete,
                              color: Theme.of(
                                context,
                              ).colorScheme.onErrorContainer,
                            ),
                          ),
                          child: Card(
                            child: ListTile(
                              title: Text(h),
                              onTap: () =>
                                  _onHabitTap(index),
                              trailing: IconButton(
                                tooltip: 'Editar',
                                icon: const Icon(Icons.edit_outlined),
                                onPressed: () => _onHabitTap(index),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
