import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,
      {super.key}); // here this.startQuiz is used as a function so we call switchScreen in this
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),

          const SizedBox(
              height: 80), // Optional: Add spacing between image and text
          Text('Learn Flutter the fun way',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
              )), 
          const SizedBox(
              height: 20), // Optional: Add spacing between text and button
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon:
                const Icon(Icons.arrow_right_alt), // Change the icon as needed
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
