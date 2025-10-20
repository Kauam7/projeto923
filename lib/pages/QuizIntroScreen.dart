import 'package:flutter/material.dart';
import 'Quiz.dart';

class QuizIntroScreen extends StatelessWidget {
  const QuizIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz - Introdução"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Bem-vindo ao Quiz de Conscientização!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              "Aqui você poderá testar seus conhecimentos. "
                  "Escolha a quantidade de perguntas e comece!",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuizScreen(quantPerguntas: 10),
                  ),
                );
              },
              child: const Text("Iniciar Quiz"),

            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuizScreen(quantPerguntas: 10),
                  ),
                );
              },
              child: const Text("Iniciar Quiz"),

            ),
          ],
        ),
      ),
    );
  }

  void quantasPerg(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    showDialog<int>(
      context: context,
      barrierColor: Colors.white,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Aviso'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Quantas perguntas quer no quiz?'),
              const SizedBox(height: 10),
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite um número',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // fecha sem confirmar
              },
              child: const Text('Fechar'),
            ),
            TextButton(
              onPressed: () {
                final String valor = _controller.text;
                final int? quantidade = int.tryParse(valor);
                if (quantidade != null && quantidade > 0) {
                  Navigator.of(dialogContext).pop(quantidade); // retorna a quantidade
                } else {
                  print("fudeu");
                }
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    ).then((quantidade) {
      // depois que o diálogo fecha, se veio uma quantidade válida, navegamos para o Quiz
      if (quantidade != null && quantidade > 0) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizScreen(quantPerguntas: quantidade),
          ),
        );
      }
    });
  }
}