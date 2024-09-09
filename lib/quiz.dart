import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/results_screen.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers =[];
  // Widget activeScreen = const StartScreen(switchScreen); // in place of var we use widget here
  // Widget? activeScreen; // ? means var may contaion widget or null
  var activeScreen = 'start-screen';
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }
 
  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionsScreen();
      activeScreen = 'questions-screen';
    });
  }
  void chooseAnswer (String answer){
    selectedAnswers.add(answer);
    if (selectedAnswers.length== questions.length){
      setState(() {
        activeScreen = 'results-screen';

      });
    }

  }

  @override
  Widget build(context) {
     Widget screenWidget = StartScreen(switchScreen );
    if (activeScreen =='questions-screen'){
    screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer,);
  }
  if (activeScreen=='results-screen'){
    screenWidget = ResultsScreen(chosenAnswers: selectedAnswers,);
  }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.indigo],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: screenWidget,
          // child: activeScreen == 'start-screen'
          //     ? StartScreen(switchScreen)
          //     : QuestionsScreen(),
        ),
      ),
    );
  }
}
