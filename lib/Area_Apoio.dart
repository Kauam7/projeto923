import 'package:flutter/material.dart';
import 'tarefas.dart';
import 'tarefas_Dao.dart';

class AreaApoio extends StatefulWidget {
  const AreaApoio({super.key});

  @override
  State<AreaApoio> createState() => _AreaApoioState();
}

class _AreaApoioState extends State<AreaApoio> {
  String fraseMotivacional = "Acredite em você! Cada passo é importante.";
  final TarefaDao _tarefaDao = TarefaDao();
  List<Tarefa> tarefasDoDia = [];

  @override
  void initState() {
    super.initState();
    _carregarTarefas();
  }

  Future<void> _carregarTarefas() async {
    String hoje = DateTime.now().toIso8601String().substring(0, 10);
    List<Tarefa> tarefas = await _tarefaDao.listarTarefasDoDia(hoje);

    if (tarefas.isEmpty) {
      await _tarefaDao.salvar(Tarefa(descricao: "Caminhei 10 minutos ou mais.", data: hoje));
      await _tarefaDao.salvar(Tarefa(descricao: "Tome 2L ou mais de água!", data: hoje));
      await _tarefaDao.salvar(Tarefa(descricao: "Anotei algo positivo hoje!", data: hoje));
      tarefas = await _tarefaDao.listarTarefasDoDia(hoje);
    }

    setState(() {
      tarefasDoDia = tarefas;
    });
  }

  Future<void> _concluirTarefa(Tarefa tarefa) async {
    tarefa.concluida = true;
    await _tarefaDao.atualizar(tarefa);
    _carregarTarefas();
  }

  void _respiracaoGuiada() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Respiração Guiada"),
          content: const Text(
            "Puxe o ar, segure por 10 segundos e solte devagar.",
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Fechar"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFBF7),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Área de Apoio",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue.shade100),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                fraseMotivacional,
                style: const TextStyle(fontSize: 16),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Respiração Guiada",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: _respiracaoGuiada,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade300,
                          foregroundColor: Colors.black87,
                        ),
                        child: const Text("Iniciar exercício"),
                      ),
                    ],
                  ),
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
            const Text(
              "Autocuidado Diário",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...tarefasDoDia.map((t) {
              return CheckboxListTile(
                title: Text(t.descricao),
                value: t.concluida,
                onChanged: (val) {
                  if (val == true) _concluirTarefa(t);
                },
              );
            }).toList(),

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
    );
  }
}
