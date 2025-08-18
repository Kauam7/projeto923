import 'package:flutter/material.dart';
import 'Quiz.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      debugShowCheckedModeBanner: false,
      home: const QuizScreen(),
    );
  }
}