import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:funfacts/widgets/loading_widget.dart';
import 'package:funfacts/widgets/page_view_widget.dart';
import 'package:logger/logger.dart';
import 'package:funfacts/screens/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var logger = Logger();
  List<dynamic> facts = [];
  bool isLoading = true;

  Future<void> getFacts() async {
    try {
      final dio = Dio();
      final Response response = await dio.get(
          'https://raw.githubusercontent.com/Ahmed-Magdy28/funfacts/master/dummydata.json');
      facts = jsonDecode(response.data);
      isLoading = false;
      setState(() {});
    } catch (e) {
      logger.d("Logger is working!");
    }
  }

  @override
  void initState() {
    super.initState();
    getFacts();
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
      body: RefreshIndicator(
        onRefresh: getFacts,
        child: isLoading ? loadingWidget() : MainPageView(facts: facts),
      ),
    );
  }
}
