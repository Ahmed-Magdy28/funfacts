import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:funfacts/screens/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var logger = Logger();
  List<String> facts = [];

  Future<void> getFacts() async {
    try {
      final dio = Dio();

      final response =
          await dio.get('https://uselessfacts.jsph.pl/random.json?language=en');

      if (response.statusCode == 200) {
        facts = response.data;
      }
    } catch (e) {
      logger.d("Logger is working!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fun Facts'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SettingsScreen();
                }));
              },
            ),
          ),
        ],
      ),
      body: PageView.builder(
          itemCount: facts.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        facts[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          setState(() {
                            if (index > 0) {
                              index--;
                            }
                          });
                        },
                      ),
                      Text("${index + 1} of ${facts.length}"),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {
                          setState(() {
                            if (index < facts.length - 1) {
                              index++;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
