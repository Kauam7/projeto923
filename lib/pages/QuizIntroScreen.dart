import 'package:flutter/material.dart';
import 'package:projeto_923/pages/GlossarioPage.dart';
import 'Quiz.dart';
import 'package:projeto_923/domain/noticia.dart';
import 'package:projeto_923/api/noticiaApi.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projeto_923/pages/mapsPage.dart';


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
        child: ListView(
          padding: const EdgeInsets.all(20),
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
                    builder: (context) => GoogleMapsPage(
                      latLong: LatLng(-9.6496, -35.7335),

                    ),
                  ),
                );
              },
              child: const Text("Ver lugares próximos"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GlossarioPage(),
                  ),
                );
              },
              child: const Text("Glossário"),
            ),

            FutureBuilder<Noticia?>(
              future: NoticiasApi.getRandomNoticia(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Text("Erro ao carregar notícia.");
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return const Text("Nenhuma notícia disponível.");
                }

                var noticia = snapshot.data!;
                return Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (noticia.urlImagem.isNotEmpty)
                          Image.network(
                            noticia.urlImagem,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        const SizedBox(height: 10),
                        Text(
                          noticia.titulo,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(noticia.descricao),
                        const SizedBox(height: 10),
                        Text(
                          "Fonte: ${noticia.fonte}",
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        )
        ,
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
                Navigator.of(dialogContext).pop();
              },
              child: const Text('Fechar'),
            ),
            TextButton(
              onPressed: () {
                final String valor = _controller.text;
                final int? quantidade = int.tryParse(valor);
                if (quantidade != null && quantidade > 0) {
                  Navigator.of(dialogContext).pop(quantidade);
                } else {
                  print("erro ocorreu");
                }
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    ).then((quantidade) {
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