import 'package:flutter/material.dart';
import 'package:funfacts/providers/theme_provider.dart';
import 'package:funfacts/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const FunFacts()));
}

class FunFacts extends StatefulWidget {
  const FunFacts({super.key});

  @override
  State<FunFacts> createState() => _FunFactsState();
}

class _FunFactsState extends State<FunFacts> {
  @override
  void initState() {
    super.initState();
    Provider.of<ThemeProvider>(context, listen: false).loadMode();
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
        theme: themeProvider.isDarkModeChecked
            ? ThemeData.dark()
            : ThemeData.light(),
        title: 'Fun Facts',
        home: const MainScreen());
  }
}
