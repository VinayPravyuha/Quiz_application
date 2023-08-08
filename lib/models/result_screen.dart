
//import 'package:practice_app/quiz.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_app/data/questions.dart';
import 'package:practice_app/models/question_summary.dart';
//import 'package:practice_app/models/quiz_questions.dart';


class ResultScreen extends StatelessWidget{
const ResultScreen({super.key, 
required this.chosenAnswers,required this.onRestart});


final List<String> chosenAnswers;

final void Function() onRestart;

 List<Map<String, Object>> getSummaryData() {
  final List<Map<String, Object>> summary =[];

    for(var i =0;i<chosenAnswers.length; i++){
      summary.add({
        'question_index': i,
        'question':  questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      },
      );
    }
  return summary;

 }
  @override

  Widget build(BuildContext context){
    final summaryData= getSummaryData();
    final numTotalQuestion = questions.length;
    final numCorrectQuestions =summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(width: double.infinity,
    child: Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ 
           Text('You have answered correctly $numCorrectQuestions out of $numTotalQuestion questions',style: GoogleFonts.oxygen(fontSize: 35,color:const  Color.fromARGB(255, 203, 215, 220))),
          const SizedBox(height: 30,),
          QuestionSummary(getSummaryData()),
          const SizedBox(height: 30,),
           TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),),
          
        ], 
        )
    ),
    );
  }
}