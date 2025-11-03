import 'package:projeto_923/domain/propriedade.dart';
import 'package:dio/dio.dart';

class PropriedadesApi {
  final dio = Dio();
  final String baseUrl = 'https://my-json-server.typicode.com/caceso222/fakeapi_flutterapp';

  Future<List<Propriedade>> findAll() async {
    List<Propriedade> listaPropriedades = [];

    final response = await dio.get('$baseUrl/glossario');

    if (response.statusCode == 200) {
      var listResult = response.data;
      print(listResult);
      for (var json in listResult) {
        Propriedade propriedade = Propriedade.fromJson(json);
        listaPropriedades.add(propriedade);
      }
    }

    return listaPropriedades;
  }
}
