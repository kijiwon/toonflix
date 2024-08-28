import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonfilx/models/webtoon_detail_model.dart';
import 'package:toonfilx/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = 'today';

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // 요청이 성공한 경우
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // String 타입인 response.body를 다시 json으로 바꿈
      final webtoon = jsonDecode(response.body);
      // json화 된 데이터를 WebtoonDetailModel로 전달
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }
}
