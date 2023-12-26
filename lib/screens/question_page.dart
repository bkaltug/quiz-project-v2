import 'package:flutter/material.dart';
import 'package:quiz/screens/opening_page.dart';
import 'package:quiz/widgets/answer_button.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int questionNumber = 1;
  int correctAnswerCounter = 8;
  bool onTappedA = false;
  bool onTappedB = false;
  bool onTappedC = false;
  bool onTappedD = false;
  late bool buttonsTapped;

  @override
  void initState() {
    super.initState();
    buttonsTapped =
        onTappedA || onTappedB || onTappedC || onTappedD ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff473b9d),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            "QuizApp",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                  ),
                  child: Text(
                    "Question $questionNumber / 10",
                    style: TextStyle(color: Colors.pink.withOpacity(0.5)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 40),
                  child: Text(
                    "Question Question Question Abcd Question Question Question ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                InkWell(
                  onTap: () => setState(() {
                    onTappedA = !onTappedA;
                    onTappedB = false;
                    onTappedC = false;
                    onTappedD = false;
                  }),
                  child: AnswerButton(
                      answerOption: "A",
                      answerText: "Answer 1",
                      onTapped: onTappedA),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => setState(() {
                    onTappedA = false;
                    onTappedB = !onTappedB;
                    onTappedC = false;
                    onTappedD = false;
                  }),
                  child: AnswerButton(
                      answerOption: "B",
                      answerText: "Answer 2",
                      onTapped: onTappedB),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => setState(() {
                    onTappedA = false;
                    onTappedB = false;
                    onTappedC = !onTappedC;
                    onTappedD = false;
                  }),
                  child: AnswerButton(
                      answerOption: "C",
                      answerText: "Answer 3",
                      onTapped: onTappedC),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => setState(() {
                    onTappedA = false;
                    onTappedB = false;
                    onTappedC = false;
                    onTappedD = !onTappedD;
                  }),
                  child: AnswerButton(
                      answerOption: "D",
                      answerText: "Answer 4",
                      onTapped: onTappedD),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Positioned(
              bottom: 50,
              child: InkWell(
                  onTap: () {
                    setState(() {
                      if (questionNumber == 10) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OpeningPage(
                                      highestScore: correctAnswerCounter,
                                    )));
                      } else {
                        questionNumber++;
                      }
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: BoxDecoration(
                        color: const Color(0xff473b9d),
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      questionNumber == 10 ? "Finish" : "Next",
                      style: const TextStyle(color: Colors.white),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
