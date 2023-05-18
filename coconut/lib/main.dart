import 'package:coconut/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

// 절대 루트. 많은 자식 요소를 가지고 있다.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
