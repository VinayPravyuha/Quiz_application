import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

 // var color1=Color.fromARGB(255, 6, 123, 70);
 // var color2=Color.fromARGB(255, 6, 123, 70);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
    height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  Text(((data['question_index'] as int) + 1).toString(),style: GoogleFonts.oxygen(backgroundColor: Colors.blue)),
                  Expanded (child: Column(
                    children: [
                      Text(data['question'] as String,style: GoogleFonts.oxygen(color: Color.fromARGB(255, 170, 203, 25),fontSize: 15),),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(data['user_answer'] as String,style: GoogleFonts.oxygen(color: Color.fromARGB(255, 180, 116, 12),fontSize: 15)),
                      
                      Text(data['correct_answer'] as String,style: GoogleFonts.oxygen(color: Color.fromARGB(255, 99, 221, 124),fontSize: 15)),
                    ],
                  )
                  ),
              
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
