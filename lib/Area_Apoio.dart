import 'package:flutter/material.dart';

class AreaApoio extends StatefulWidget {
  const AreaApoio({super.key});

  @override
  State<AreaApoio> createState() => _AreaApoioState();
}

  class _AreaApoioState extends State<AreaApoio> {
  bool caminhou = false;
  bool bebeuAgua = false;
  bool anotouAlgo = false;

  String fraseMotivacional = "Acredite em você! Cada passo importa.";

  @override
  Widget build(BuildContext context) {
  return SafeArea(
  child: Scaffold(
      backgroundColor: const Color(0xFFFFFBF7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Área de Apoio",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue.shade100),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      fraseMotivacional,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 20),


            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue.shade100),
                borderRadius: BorderRadius.circular(16),
              ), child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Respiração Guiada",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade300,
                      foregroundColor: Colors.black87,
                    ),
                    child: const Text("Iniciar exercício"),
                     ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                ClipOval(
                  child: Image.asset(
                    'assets/imagen.png',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue.shade100),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Vídeo de motivação",
                    style: TextStyle(fontSize: 16),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade300,
                      foregroundColor: Colors.black87,
                    ),
                    child: const Text("Assistir vídeo"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Autocuidado Diário",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: const Text("Caminhei 10 minutos ou mais."),
              value: caminhou,
              onChanged: (val) {
                setState(() => caminhou = val ?? false);
              },
            ),
            CheckboxListTile(
              title: const Text("Bebi bastante água!"),
              value: bebeuAgua,
              onChanged: (val) {
                setState(() => bebeuAgua = val ?? false);
              },
            ),
            CheckboxListTile(
              title: const Text("Anotei algo positivo."),
              value: anotouAlgo,
              onChanged: (val) {
                setState(() => anotouAlgo = val ?? false);
              },
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade300,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text("Sair"),
            ),
          ],
        ),
       ),
      ),
     );
   }
  }