import 'package:flutter/material.dart';
import 'package:quiz/screens/opening_page.dart';
import 'package:quiz/widgets/answer_button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key, required this.category});
  final String category;

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int questionNumber = 1;
  int correctAnswerCounter = 0;
  bool onTappedA = false;
  bool onTappedB = false;
  bool onTappedC = false;
  bool onTappedD = false;
  String categoryUrl = "";

  List responseData = [];
  List<Map<String, String>> questionList = [];
  List<Map<String, List<String>>> answerList = [];

  @override
  void initState() {
    super.initState();
    api();
    if (widget.category == "Animals") {
      categoryUrl =
          "https://opentdb.com/api.php?amount=10&category=20&difficulty=medium&type=multiple";
    } else if (widget.category == "Celebrities") {
      categoryUrl =
          "https://opentdb.com/api.php?amount=10&category=20&difficulty=medium&type=multiple";
    }
  }

  Future api() async {
    var response = await http.get(Uri.parse(categoryUrl));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['results'];
      setState(() {
        responseData = data;
        for (int i = 1; i <= 10; i++) {
          questionList.add({"Question $i": data[i - 1]["question"]});
          answerList.add({
            "Answers of question $i": [
              data[i - 1]["correct_answer"],
              data[i - 1]["incorrect_answers"][0],
              data[i - 1]["incorrect_answers"][1],
              data[i - 1]["incorrect_answers"][2]
            ]
          });
          answerList[i - 1]["Answers of question $i"]!.shuffle();
        }
      });
    }
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
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            )),
        body: responseData.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 40, left: 10, right: 10),
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
                            style:
                                TextStyle(color: Colors.pink.withOpacity(0.5)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 40),
                          child: Text(
                            questionList[questionNumber - 1]
                                ["Question $questionNumber"]!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
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
                            if (answerList[questionNumber - 1][
                                        "Answers of question $questionNumber"]![
                                    0] ==
                                responseData[questionNumber - 1]
                                    ["correct_answer"]) {
                              correctAnswerCounter++;
                            }
                            onTappedA = !onTappedA;
                            onTappedB = false;
                            onTappedC = false;
                            onTappedD = false;
                          }),
                          child: AnswerButton(
                              answerOption: "A",
                              answerText: answerList[questionNumber - 1]
                                  ["Answers of question $questionNumber"]![0],
                              onTapped: onTappedA),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () => setState(() {
                            if (answerList[questionNumber - 1][
                                        "Answers of question $questionNumber"]![
                                    1] ==
                                responseData[questionNumber - 1]
                                    ["correct_answer"]) {
                              correctAnswerCounter++;
                            }
                            onTappedA = false;
                            onTappedB = !onTappedB;
                            onTappedC = false;
                            onTappedD = false;
                          }),
                          child: AnswerButton(
                              answerOption: "B",
                              answerText: answerList[questionNumber - 1]
                                  ["Answers of question $questionNumber"]![1],
                              onTapped: onTappedB),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () => setState(() {
                            if (answerList[questionNumber - 1][
                                        "Answers of question $questionNumber"]![
                                    2] ==
                                responseData[questionNumber - 1]
                                    ["correct_answer"]) {
                              correctAnswerCounter++;
                            }

                            onTappedA = false;
                            onTappedB = false;
                            onTappedC = !onTappedC;
                            onTappedD = false;
                          }),
                          child: AnswerButton(
                              answerOption: "C",
                              answerText: answerList[questionNumber - 1]
                                  ["Answers of question $questionNumber"]![2],
                              onTapped: onTappedC),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () => setState(() {
                            if (answerList[questionNumber - 1][
                                        "Answers of question $questionNumber"]![
                                    3] ==
                                responseData[questionNumber - 1]
                                    ["correct_answer"]) {
                              correctAnswerCounter++;
                            }

                            onTappedA = false;
                            onTappedB = false;
                            onTappedC = false;
                            onTappedD = !onTappedD;
                          }),
                          child: AnswerButton(
                              answerOption: "D",
                              answerText: answerList[questionNumber - 1]
                                  ["Answers of question $questionNumber"]![3],
                              onTapped: onTappedD),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                        onTap: onTappedA == false &&
                                onTappedB == false &&
                                onTappedC == false &&
                                onTappedD == false
                            ? () {}
                            : () {
                                setState(() {
                                  onTappedA = false;
                                  onTappedB = false;
                                  onTappedC = false;
                                  onTappedD = false;

                                  if (questionNumber == 10) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => OpeningPage(
                                                  highestScore:
                                                      correctAnswerCounter,
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
                        ))
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
