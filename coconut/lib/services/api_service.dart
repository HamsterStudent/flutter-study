//
// Api에 요청을 보내는 파일!!
//
import 'dart:convert';
import 'package:coconut/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodayToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    // get이 받는 future 자료형 : 응답을 받을 때까지 대기하는 역할. 당장 완료될 수 있는 작업이 아님
    // future는 데이터를 받을 때까지 기다렸다가 완료될 때 response형으로 반환.
    final hamster = await http.get(url); // 웹에 http요청 보냄
    // dart에게 요청을 기다리라고 말할 때엔 await를 사용한다.
    // await는 비동기 함수 내에서만 사용할 수 있음

    // response가 성공적이었는지 여부 확인
    if (hamster.statusCode == 200) {
      // jsonDecode : json으로 변환해줌
      final List<dynamic> webtoons = jsonDecode(hamster.body);
      // 가져온 webtoons를  순회하면서 하나씩 출력
      for (var webtoon in webtoons) {
        // api에서 가져온 json으로 webtoonModel을 만들고 싶음
        final toon = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(toon);
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
