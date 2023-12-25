import 'package:flutter/material.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Question"),
          ElevatedButton(onPressed: () {}, child: Text("Question 1")),
        ],
      ),
    );
  }
}
