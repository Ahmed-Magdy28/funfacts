import 'package:flutter/material.dart';

class MainPageView extends StatefulWidget {
  final List<dynamic> facts;

  const MainPageView({super.key, required this.facts});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.facts.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.facts[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 24),
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
                    Text("${index + 1} of ${widget.facts.length}"),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () {
                        setState(() {
                          if (index < widget.facts.length - 1) {
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
        });
  }
}
