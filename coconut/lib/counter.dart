import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<int> numbers = [];
  void onClicked() {
    // flutter 위젯에 새 데이터가 있다고 알림
    // setState안에 데이터를 넣지 않아도, 데이터가 변경된 후 setState를 불러오면 새로 랜더링됨
    setState(() {
      numbers.add(numbers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Click Count',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              for (var n in numbers) Text('$n'),
              IconButton(
                iconSize: 40,
                onPressed: onClicked,
                icon: const Icon(
                  Icons.lunch_dining_sharp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
