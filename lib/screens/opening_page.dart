import 'package:flutter/material.dart';
import 'package:quiz/screens/question_page.dart';

class OpeningPage extends StatelessWidget {
  const OpeningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Quiz"),
          ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const QuestionPage())),
              child: const Text("Start Quiz"))
        ],
      ),
    );
  }
}
