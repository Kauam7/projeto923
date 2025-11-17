import 'package:flutter/material.dart';
import 'package:projeto_923/tarefas_api.dart';
import 'tarefas.dart';
import 'tarefas_Dao.dart';


class AreaApoio extends StatefulWidget {
  const AreaApoio({super.key});


  @override
  State<AreaApoio> createState() => _AreaApoioState();
}


class _AreaApoioState extends State<AreaApoio> {
  String fraseMotivacional = "Acredite em você! Cada passo é importante.";
  late Future<List<Tarefa>> futureTarefas;
  List<Tarefa> tarefasDoDia = [];


  bool _mostrarConteudo = false;


  @override
  void initState() {
    super.initState();
    _carregarTarefas();
  }


  Future<void> _carregarTarefas() async {
    String hoje = DateTime.now().toIso8601String().substring(0, 10);
    futureTarefas = TarefasApi().buscarTarefas();
  }


  // Future<void> _concluirTarefa(Tarefa tarefa) async {
  //   tarefa.concluida = true;
  //   await _tarefaDao.atualizar(tarefa);
  //   _carregarTarefas();
  // }


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
            ),
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
        body: buildBody(),
      ),
    );
  }


  buildBody() {
    return FutureBuilder(
      future: futureTarefas,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildListView(snapshot.requireData);
        }


        return const Center(
          child: CircularProgressIndicator(backgroundColor: Colors.grey),
        );
      },
    );
  }


  buildListView(tarefasDoDia) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue.shade100),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(fraseMotivacional, style: const TextStyle(fontSize: 16)),
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
            subtitle: Text("Data: ${t.data}"),
            value: t.concluida,
            onChanged: (val) {
              // if (val == true) _concluirTarefa(t);
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
            padding: const EdgeInsets.symmetric(vertical: 20),
          ),
          child: const Text("Sair"),
        ),
      ],
    );
  }
}

