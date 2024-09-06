import 'package:flutter/material.dart';
import 'package:funfacts/screens/main_screen.dart';

void main() {
  runApp(const FunFacts());
}

class FunFacts extends StatefulWidget {
  const FunFacts({super.key});

  @override
  State<FunFacts> createState() => _FunFactsState();
}

class _FunFactsState extends State<FunFacts> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Fun Facts', home: MainScreen());
  }
}
