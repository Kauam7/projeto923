import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Simples',
      debugShowCheckedModeBanner: false,
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // Definindo a pergunta e as alternativas
  String question = "Qual é a capital do Brasil?";
  List<String> alternatives = [
    "Porto Alegre",
    "Belo Horizonte",
    "Brasília", // resposta correta
    "Recife",
  ];

  // Índice da resposta correta (nesse caso, "Brasília" é a alternativa do índice 2)
  final int correctAnswerIndex = 2;

  // Variável para armazenar o índice da resposta selecionada
  int? selectedIndex;

  // Variável para exibir o resultado da validação
  String resultText = "";

  // Função que verifica se a resposta selecionada está correta
  void checkAnswer() {
    if (selectedIndex == null) return;

    setState(() {
      if (selectedIndex == correctAnswerIndex) {
        resultText = "Resposta correta!";
      } else {
        resultText = "Resposta incorreta!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz Simples")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Exibição da pergunta
            Text(
              question,
              style: TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Exibição das alternativas usando RadioListTile
            Column(
              children: List.generate(alternatives.length, (index) {
                return Card(
                  child: RadioListTile<int>(
                    value: index,
                    groupValue: selectedIndex,
                    onChanged: (value) {
                      setState(() {
                        selectedIndex = value;
                        resultText =
                            ""; // Reinicia a mensagem de resultado ao mudar a seleção
                      });
                    },
                    title: Text(alternatives[index]),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            // Botão para confirmar a resposta
            ElevatedButton(onPressed: checkAnswer, child: Text("Confirmar")),
            SizedBox(height: 20),
            // Exibição do resultado (correto ou incorreto)
            Text(
              resultText,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
