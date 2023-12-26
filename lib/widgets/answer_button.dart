import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answerOption;
  final String answerText;
  final bool onTapped;
  const AnswerButton(
      {super.key,
      required this.answerOption,
      required this.answerText,
      required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: onTapped
              ? const Color(0xff473b9d)
              : Colors.grey.withOpacity(0.2)),
      child: Row(
        children: [
          CircleAvatar(
            radius: 17,
            backgroundColor:
                onTapped ? Colors.white : Colors.white.withOpacity(0.7),
            child: Text(answerOption),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            answerText,
            style: TextStyle(color: onTapped ? Colors.white : Colors.black),
          )
        ],
      ),
    );
  }
}
