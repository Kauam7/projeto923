import 'package:projeto_923/Address.dart';
import 'package:dio/dio.dart';
import 'tarefas.dart';

class TarefasApi {
  final dio = Dio();
  String baseUrl = 'https://my-json-server.typicode.com/vitor3022/API_fakes';

  Future<List<Tarefa>> buscarTarefas() async {
    var result = await dio.get('$baseUrl/tarefas');
    List<Tarefa> lista = [];

    //if (result.statusCode == 200) {

    for(var json in result.data){
      Tarefa tarefa = Tarefa.fromJson(json);
      lista.add(tarefa);
    }


    return lista;
    //}
  }
}
