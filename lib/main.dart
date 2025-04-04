import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plumbing Quote',
      home: Scaffold(
        appBar: AppBar(title: const Text('Plumbing Quote')),
        body: const Center(child: Text('Hello!')),
      ),
    );
  }
}
