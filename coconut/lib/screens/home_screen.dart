import 'package:coconut/models/webtoon_model.dart';
import 'package:coconut/services/api_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService.getTodayToons();

  @override
  Widget build(BuildContext context) {
    print(webtoons);
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
            return const Text('Its Data!!');
          }
          return const Text('Loading...');
        },
      ),
    );
  }
}
