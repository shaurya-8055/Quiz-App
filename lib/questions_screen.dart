import 'package:quiz_app/answers_button.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function (String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState(){
    return _QuestionsScreenState();
  }
}
class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex= 0;
  void answerQuestion (String selectedAnswers){
    widget.onSelectAnswer(selectedAnswers);
    setState(() {
      currentQuestionIndex++;
    });
    
  }
  @override
  Widget build(context){
    final currentquestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,  // it give max width 
      child: Container(
        margin: const EdgeInsets.all(40),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(currentquestion.text,
        style: GoogleFonts.lato(
          color:Color.fromARGB(255, 67, 217, 234),
          fontSize: 24,
          fontWeight: FontWeight.bold,

          ),
        textAlign: TextAlign.center,
        ),
        
        
        const SizedBox(height: 30,),
        ...currentquestion.getShuffledAnswers().map((answers){
          return AnswersButton(
            answerText: answers,
           onTap: (() {
              answerQuestion(answers);
           }),);
        })
      
        // AnswersButton(answerText: currentquestion.answers[0], onTap: () {}),
        // AnswersButton(answerText: currentquestion.answers[1], onTap: () {}),
        // AnswersButton(answerText: currentquestion.answers[2], onTap: () {}),
        // AnswersButton(answerText: currentquestion.answers[3], onTap: () {}),
        
        
  ]
      ),
      ),
    );
  }
}