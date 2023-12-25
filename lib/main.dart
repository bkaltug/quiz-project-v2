import 'package:flutter/material.dart';
import 'package:quiz/screens/opening_page.dart';

void main() => runApp(const Quiz());

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const OpeningPage(),
    );
  }
}
