import 'package:flutter/material.dart';
import '../db/pergunta_dao.dart';
import '../domain/pergunta.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late PerguntaDao _perguntaDao;
  Pergunta? _pergunta;
  int? selectedIndex;
  bool conf_resp = false;
  int quant_perguntas = 2;
  int perg_atual = 0;

  @override
  void initState() {
    super.initState();
    _perguntaDao = PerguntaDao();
    _carregarPergunta();
  }

  Future<void> _carregarPergunta() async {
    try {
      var pergunta = await _perguntaDao.carregarPerguntas(quant_perguntas);
      setState(() {
        _pergunta = pergunta[perg_atual];
        perg_atual++;
      });
    } catch (e) {
      print('Erro ao carregar pergunta: $e');
    }
  }

  void selectAlternative(int index) {
    setState(() => selectedIndex = index);
  }

  void _confirmarResposta() {
    if(conf_resp){

          _carregarPergunta();
          conf_resp = false;

    }else{
      conf_resp = true;
    if (selectedIndex == null || _pergunta == null) return;

    bool correta = (selectedIndex! + 1) == _pergunta!.respostaCorreta;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(correta ? 'Correto!' : 'Incorreto'),
        content: Text(correta
            ? 'Você acertou a resposta!'
            : 'A resposta correta é: ${_pergunta!.alternativas[_pergunta!.respostaCorreta - 1]}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
  }

  @override
  Widget build(BuildContext context) {


    if (_pergunta == null) {
      return Scaffold(
        appBar: AppBar(title: Text("Quiz")),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _pergunta!.texto,
              style: const TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            Column(
              children: List.generate(_pergunta!.alternativas.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? Colors.purple.withOpacity(0.1)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 2),
                    ],
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(4),
                    onTap: () => selectAlternative(index),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Icon(
                            selectedIndex == index
                                ? Icons.radio_button_checked
                                : Icons.radio_button_unchecked,
                            color: selectedIndex == index
                                ? Colors.purple
                                : Colors.grey,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              _pergunta!.alternativas[index],
                              style: TextStyle(
                                fontSize: 16,
                                color: selectedIndex == index ? Colors.purple : Colors.black87,
                              ),
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),

            const Spacer(),

            Container(
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(4),
              ),
              child: ElevatedButton(
                onPressed: _confirmarResposta,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.check),
                    SizedBox(width: 8),
                    Text(
                      "Confirmar",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              ),
          ],
        ),
      ),
    );
  }
}