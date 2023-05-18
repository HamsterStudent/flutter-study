import 'package:coconut/pomodoros/screens/home_screen.dart';
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color(0xFFE7626C),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        cardColor: const Color(0xFFF4EDDB),
      ),
      home: const HomeScreen(),
    );
  }
}
