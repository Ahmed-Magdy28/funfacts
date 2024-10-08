import 'package:flutter/material.dart';
import 'package:funfacts/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({super.key});

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Theme Mode'),
          Row(
            children: [
              Switch(
                  value: themeProvider.isDarkModeChecked,
                  onChanged: (value) {
                    themeProvider.updateIsDarkModeChecked(darkMode: value);
                  }),
              const SizedBox(width: 20),
              Text(
                  themeProvider.isDarkModeChecked ? "Dark Mode" : "Light Mode"),
            ],
          )
        ],
      ),
    );
  }
}
