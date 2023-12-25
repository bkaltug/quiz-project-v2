import 'package:flutter/material.dart';
import 'package:quiz/screens/question_page.dart';

class OpeningPage extends StatefulWidget {
  const OpeningPage({super.key});

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff473b9d),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 200),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height / 6.5,
              child: const CircleAvatar(
                radius: 75,
                foregroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                ),
              )),
          Positioned(
            top: MediaQuery.of(context).size.height / 2.8,
            child: const Text(
              "Zeynep Güner",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 1.7,
            child: const Text(
              "Highest Score",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 1.6,
            child: Text(
              "$score /10",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 4,
            right: MediaQuery.of(context).size.width / 4,
            bottom: 50,
            child: ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QuestionPage())),
                child: const Text("Start Quiz")),
          )
        ],
      ),
    );
  }
}
