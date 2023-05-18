import 'package:coconut/models/webtoon_model.dart';
import 'package:coconut/services/api_service.dart';
import 'package:coconut/widgets/webtoon_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodayToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green.shade300,
        title: const Text(
          "Today's Toons",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons, // 기다릴 값
        // snapshot : future의 상태
        // builder function : context, snapshot 전달받음
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // ListView.builder : 사용자가 보고 있는 아이템만 build한다
            // 보고 있지 않는 항목은 메모리에서 삭제
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                // Expanded는 child를 확장해서 남는 공간을 채우게 함
                Expanded(
                  child: makeList(snapshot),
                )
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  // 잦은 빌더 사용으로 복잡해져서 Extract Method로 추출
  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      scrollDirection: Axis.horizontal,
      // data의 갯수를 말해줌으로써 성능에 이점을 줌
      itemCount: snapshot.data!.length,
      // ListView.builder가 아이템을 build할 때 호출하는 함수
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
