import 'package:flutter/material.dart';
import 'dart:async';

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
          backgroundColor: const Color(0xFFe64d3d),
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;
  int totalSeconds = twentyFiveMinutes;
  bool isRunning = false;
  bool takeRestTime = false;
  late Timer timer;
  int round = 0;
  int goal = 0;
  Map<String, int> timeList = {
    "15": 900,
    "20": 1200,
    "25": 1500,
    "30": 1800,
    "35": 2100,
  };

  void onTick(Timer timer) {
    if (totalSeconds == 0 && !takeRestTime) {
      if (round == 3) {
        setState(() {
          goal++;
          round = 0;
          isRunning = false;
          totalSeconds = 300;
          takeRestTime = true;
        });
      } else {
        setState(() {
          round++;
          isRunning = false;
          totalSeconds = twentyFiveMinutes;
        });
      }
      timer.cancel();
    } else {
      setState(() {
        totalSeconds--;
      });
    }
    if (totalSeconds == 0 && takeRestTime) {
      setState(() {
        takeRestTime = false;
        isRunning = false;
        totalSeconds = twentyFiveMinutes;
      });
      timer.cancel();
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onReset() {
    timer.cancel();
    setState(() {
      isRunning = false;
      totalSeconds = twentyFiveMinutes;
    });
  }

  void selected15() {
    setState(() {
      totalSeconds = timeList['15']!;
    });
  }

  void selected20() {
    setState(() {
      totalSeconds = timeList['20']!;
    });
  }

  void selected25() {
    setState(() {
      totalSeconds = timeList['25']!;
    });
  }

  void selected30() {
    setState(() {
      totalSeconds = timeList['30']!;
    });
  }

  void selected35() {
    setState(() {
      totalSeconds = timeList['35']!;
    });
  }

  String minuteFormat(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(5, 7);
  }

  String secondsFormat(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'POMOTIMER',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(
                      secondsFormat(totalSeconds),
                      style: TextStyle(
                          fontSize: 84,
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).colorScheme.background),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(
                      minuteFormat(totalSeconds),
                      style: TextStyle(
                          fontSize: 84,
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).colorScheme.background),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: selected15,
                      child: const Text(
                        '15',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: selected20,
                      child: const Text(
                        '20',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: selected25,
                      child: const Text(
                        '25',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: selected30,
                      child: const Text(
                        '30',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: selected35,
                      child: const Text(
                        '35',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    icon: isRunning
                        ? const Icon(Icons.pause_circle_rounded)
                        : const Icon(
                            Icons.play_circle_rounded,
                          ),
                  ),
                  IconButton(
                    onPressed: onReset,
                    icon: const Icon(
                      Icons.restore,
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        '$round/4',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'ROUND',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '$goal/12',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'GOAL',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class button extends StatelessWidget {
  final String minute;
  final int seconds;

  const button({super.key, required this.minute, required this.seconds});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Text(
        minute,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
