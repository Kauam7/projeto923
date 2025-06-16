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

class QuizScreen extends StatelessWidget {
  // Definindo a pergunta e as alternativas
  final String question = "Qual é a capital do Brasil?";
  final List<String> alternatives = [
    "Porto Alegre",
    "Belo Horizonte",
    "Brasília", // resposta correta
    "Recife",
  ];

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
            // Exibição das alternativas usando RadioListTile sem funcionalidade
            Column(
              children: List.generate(alternatives.length, (index) {
                return Card(
                  child: RadioListTile<int>(
                    value: index,
                    groupValue: null, // Nenhuma alternativa selecionada
                    onChanged: null, // Sem ação ao tocar
                    title: Text(alternatives[index]),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            // Botão "Confirmar" com aparência, mas sem funcionalidade
            ElevatedButton(
              onPressed: null, // Botão desabilitado, sem ação
              child: Text("Confirmar"),
            ),
            SizedBox(height: 20),
            // Espaço para exibição de resultado (neste caso, vazio)
            Text(
              "",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
