import 'package:flutter/material.dart';

class HabitooApp extends StatelessWidget {
  const HabitooApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _PlaceholderHome(),
    );
  }
}

class _PlaceholderHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Habitoo')),
      body: Center(child: Text('Hábitos')),
    );
  }
}
