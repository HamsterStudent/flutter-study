import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

// 절대 루트. 많은 자식 요소를 가지고 있다.
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.amber,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text('nothing'),
              IconButton(
                onPressed: toggleTitle,
                icon: const Icon(
                  Icons.cake_rounded,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  //위젯 라이프사이클

  // 상태변수를 초기화해주는 기능.
  // 항상 빌드보다 전에 호출되어야 한다
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState');
  }

  // 위젯이 스크린에서 제거될 때 호출되는 메서드
  // API 업데이트, 이벤트 구독취소, form 리스너로부터 벗어나고 싶을 때 쓰임
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        // dart는 null safety라서 null값에 접근하는걸 싫어함.
        // !를 넣어서 확신시켜주거나, ?를 넣어서 있다면 넣으라고 명령할 수 있다.
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
