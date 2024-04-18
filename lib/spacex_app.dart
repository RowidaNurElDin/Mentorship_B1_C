import 'package:flutter/material.dart';

class SpacexApp extends StatelessWidget {
  const SpacexApp({super.key});
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Text(
          "yarab nebda2"
        ),
      ),
    );
  }
}