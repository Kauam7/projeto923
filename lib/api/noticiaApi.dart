import 'dart:math';
import 'package:dio/dio.dart';
import 'package:projeto_923/domain/noticia.dart';

class NoticiasApi {

  static Future<Noticia?> getRandomNoticia() async {
    try {
      final dio = Dio();
      final String baseUrl =
          'https://newsapi.org/v2/top-headlines?category=health&q=cancer&apiKey=';

      final response = await dio.get(baseUrl);

      if (response.statusCode == 200) {
        List artigos = response.data['articles'];

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
