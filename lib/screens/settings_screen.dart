import 'package:flutter/material.dart';
import 'package:funfacts/widgets/theme_switcher.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: const Column(
          children: [
            ThemeSwitcher(),
          ],
        ),
      ),
    );
  }
}
