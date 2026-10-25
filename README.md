# Quiz App

A small Flutter quiz app I built while learning Flutter. It asks six
multiple-choice questions about Flutter basics, then shows a results screen
with your score and a per-question summary.

## What it does

- Start screen with a logo and a button to begin the quiz.
- One question at a time; the answer options are shuffled on every question.
- Results screen showing "You got X out of 6 correct!", plus each question
  with your answer (green if right, red if wrong) and the correct answer.

Questions live in `lib/data/questions.dart`; the first answer in each list is
the correct one (the UI shuffles them before display).

## Project structure

```
lib/
├── main.dart                  # runApp(Quiz())
├── quiz.dart                  # switches between start / questions / results
├── start_screen.dart
├── questions_screen.dart
├── answers_button.dart
├── results_screen.dart
├── questions_summary.dart
├── models/quiz_questions.dart # question model + answer shuffling
└── data/questions.dart        # the question list
```

## Running it

Requires the Flutter SDK (Dart `^3.5.1`).

```bash
git clone https://github.com/shaurya-8055/Quiz-App.git
cd Quiz-App
flutter pub get
flutter run
```

## License

[MIT](LICENSE)
