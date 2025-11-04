import 'dart:math';
import 'package:dio/dio.dart';
import 'package:projeto_923/domain/noticia.dart';

class NoticiasApi {
  final dio = Dio();
  final String baseUrl =
      'https://newsapi.org/v2/top-headlines?category=health&q=cancer&apiKey=SUA_CHAVE_API';

  Future<Noticia?> getRandomNoticia() async {
    try {
      final response = await dio.get(baseUrl);

      if (response.statusCode == 200) {
        final List artigos = response.data['articles'];

        if (artigos.isEmpty) return null;

        final random = Random();
        final randomJson = artigos[random.nextInt(artigos.length)];

        return Noticia.fromJson(randomJson);
      }
    } catch (e) {
      print("Erro ao buscar notícias: $e");
    }
    return null;
  }
}
