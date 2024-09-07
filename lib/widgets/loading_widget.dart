import 'package:flutter/material.dart';

Widget loadingWidget() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircularProgressIndicator(),
      SizedBox(height: 20),
      Center(child: Text("Is Loading")),
    ],
  );
}
