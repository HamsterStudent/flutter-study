import 'package:flutter/material.dart';

void main() {
  runApp(App()); // 앱의 root는 Matrial과 iOS디자인 중 하나를 선택해야함
}

// App를 위젯으로 바꾸기 위해 statelessWidget 상속받음
// StatelessWidget : 화면에 뭔가를 띄워줌
class App extends StatelessWidget {
  // 위젯이 된다는 것 = build 메소드를 구현해야한다는 계약을 맺는 것

  // 부모 클래스에 있는 메소드를 override
  @override
  Widget build(BuildContext context) {
    // 이 메소드는 또 다른 위젯을 return해야 함
    // MaterialApp은 root스타일이 될 것을 선택하는것
    return MaterialApp(
      // Scaffold : 화면의 구성 및 구조에 관한 걸 가지고 있음
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hamster"),
        ),
        body: Center(
          child: Text("Hello World!!!"),
        ),
      ),
    );
    //scaffold
  }
}
