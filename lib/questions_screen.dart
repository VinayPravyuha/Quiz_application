import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_app/models/answers_button.dart';

import 'package:practice_app/data/questions.dart';


class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key,required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex=0;

  void answeQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
    //currentQuestionIndex =currentQuestionIndex +1;
    //currentQuestionIndex+=1;
    setState((){ 
      currentQuestionIndex++;
    });
   
    }
   @override
  Widget build(context) {
    final currentQuestion=questions[currentQuestionIndex];
    return SizedBox(
      width:double.infinity,
      child: Container(
        margin :const EdgeInsets.all(40),
        child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children:[ Text(currentQuestion.text,
    style: GoogleFonts.lato(color: const Color.fromARGB(255, 202, 39, 208),
    fontSize: 24,
    fontWeight: FontWeight.bold,
    )
    )
    ,
    
    const SizedBox(height: 50),

    ...currentQuestion.getShuffledAnswers().map((answer){
      return AnswerButton(answerText: answer, onTap: (){
        answeQuestion(answer);
      });
    })
   
    ],
    ),
    ),);
  }
}