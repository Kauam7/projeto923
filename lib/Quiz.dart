import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Simples',
      debugShowCheckedModeBanner: false,
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatelessWidget {
  final String question = "Qual é a capital do Brasil?";
  final List<String> alternatives = [
    "Porto Alegre",
    "Belo Horizonte",
    "Brasília",
    "Recife",
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz Simples")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              question,
              style: TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Column(
              children: List.generate(alternatives.length, (index) {
                return Card(
                  child: ListTile(
  leading: Icon(Icons.radio_button_unchecked),
  title: Text(alternatives[index]),
);

                );
              }),
            ),
           SizedBox(height: 20),
Container(
  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
  decoration: BoxDecoration(
    color: Theme.of(context).colorScheme.primary,
    borderRadius: BorderRadius.circular(4),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 2,
        offset: Offset(0, 2),
      ),
    ],
  ),
  child: Text(
    "Confirmar",
    style: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  ),
),
SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
