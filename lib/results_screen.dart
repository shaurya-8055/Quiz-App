import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  int getCorrectAnswersCount() {
    int correctCount = 0;
    for (var i = 0; i < chosenAnswers.length; i++) {
      if (chosenAnswers[i] == questions[i].answers[0]) {
        correctCount++;
      }
    }
    return correctCount;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final correctAnswersCount = getCorrectAnswersCount();

    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF00C6FF), // Start color
              Color(0xFF0072FF), // End color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You got $correctAnswersCount out of ${chosenAnswers.length} correct!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: summaryData.length,
                  itemBuilder: (context, index) {
                    final data = summaryData[index];
                    final isCorrect = data['user_answer'] == data['correct_answer'];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(
                          'Question ${index + 1}: ${data['question']}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your answer: ${data['user_answer']}',
                              style: TextStyle(
                                color: isCorrect ? Colors.green : Colors.red,
                              ),
                            ),
                            Text('Correct answer: ${data['correct_answer']}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}