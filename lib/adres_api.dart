import 'package:projeto_923/Address.dart';
import 'package:dio/dio.dart';

class AddressApi {
  final dio = Dio();
  String baseUrl = 'https://api.supadata.ai/v1';
      String _apikey = 'sd_b25fbb98b1856d31219471a934e2615a';

      Future<Transcricao> buscarTranscricao(String videoUrl) async{
        var result = await dio.get('$baseUrl/transcript',
       queryParameters: {'url': videoUrl},
            options: Options(headers: {'x-api-key': _apikey}),
        );

        //if (result.statusCode == 200) {
        var json = result.data;
       Transcricao transcricao = Transcricao.fromJson(json);
        return transcricao;
        //}
  }
  }