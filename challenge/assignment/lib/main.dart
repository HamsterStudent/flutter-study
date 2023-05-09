import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class Date extends StatelessWidget {
  final String text;
  final bool isInverted;

  const Date({
    super.key,
    required this.text,
    required this.isInverted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            color: isInverted ? Colors.white : Colors.white.withOpacity(0.5),
            fontSize: 56,
            letterSpacing: 2,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }
}

class Card extends StatelessWidget {
  final String dailyText;
  final Color bgColor;
  final String first, secone, third;
  final String startMonth, startDate, endMonth, endDate;

  String? others;

  Card({
    super.key,
    required this.dailyText,
    required this.bgColor,
    required this.first,
    required this.secone,
    required this.third,
    required this.startMonth,
    required this.startDate,
    required this.endMonth,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    CardDate(
                      startMonth: startMonth,
                      startDate: startDate,
                      endMonth: endMonth,
                      endDate: endDate,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          dailyText,
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w800,
                          ),
                        )
                      ],
                    ),
                    attendList(
                      first: first,
                      secone: secone,
                      third: third,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardDate extends StatelessWidget {
  final String startMonth, startDate, endMonth, endDate;

  const CardDate(
      {super.key,
      required this.startMonth,
      required this.startDate,
      required this.endMonth,
      required this.endDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Text(
              startMonth,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
        Column(
          children: [
            Text(
              startDate,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Column(
          children: [
            Text(
              endMonth,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
        Column(
          children: [
            Text(
              endDate,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ],
    );
  }
}

class attendList extends StatelessWidget {
  final String first, secone, third;
  String? others;

  attendList(
      {super.key,
      required this.first,
      required this.secone,
      required this.third});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          first,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: first == 'ME' ? Colors.black : Colors.black.withOpacity(0.5),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          secone,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          third,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        Text(
          others = '',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF1F1F1F),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Image.network(
                        'https://ae01.alicdn.com/kf/S83d03e2ad32e4437b0ac60d1de24207dP/GoodSmile-GSC-1615-Hamtaro-Anime-PVC.jpg_Q90.jpg_.webp',
                        width: 60,
                        height: 60,
                      ),
                    ),
                    const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MONDAY 16',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Date(
                            text: 'TODAY',
                            isInverted: true,
                          ),
                          Date(
                            text: '17',
                            isInverted: false,
                          ),
                          Date(
                            text: '18',
                            isInverted: false,
                          ),
                          Date(
                            text: '19',
                            isInverted: false,
                          ),
                          Date(
                            text: '20',
                            isInverted: false,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Card(
                  dailyText: 'DESIGN\nMEETING',
                  bgColor: const Color(0xFFFEF754),
                  first: 'ALEX',
                  secone: 'HELENA',
                  third: 'NANA',
                  startMonth: '11',
                  startDate: '30',
                  endMonth: '12',
                  endDate: '20',
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  dailyText: 'DAILY\nPROJECT',
                  bgColor: const Color(0xFF9c6bce),
                  first: 'ME',
                  secone: 'RICHARD',
                  third: 'CIRY',
                  startMonth: '12',
                  startDate: '35',
                  endMonth: '14',
                  endDate: '10',
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  dailyText: 'WEEKLY\nPLANNING',
                  bgColor: const Color(0xFFbcee4b),
                  first: 'DEN',
                  secone: 'NANA',
                  third: 'MARK',
                  startMonth: '15',
                  startDate: '00',
                  endMonth: '16',
                  endDate: '30',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
