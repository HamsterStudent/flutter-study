// 다른 클래스들이 어떤 청사진을 가지고 있어야 하는지 정의해줌
// 상속할 클래스에 extend를 써서 확장시킨다
// 특정 method를 만들도록 강제함
abstract class Human {
  void walk();
}

// enum : 형식 지정
enum Team { red, blue }

enum XPLevel { beginner, medium, pro }

class Player extends Human {
  String name;
  XPLevel xp;
  int age;
  Team team;

  void walk() {
    print('im walking');
  }

  Player(
      {required this.name,
      required this.xp,
      required this.age,
      required this.team});

  void sayHello() {
    print('hello $name : $xp : $age : $team');
  }
}

class Coach extends Human {
  void walk() {
    print('im walking too much');
  }
}

void main() {
  var hams =
      Player(name: 'hamster', xp: XPLevel.beginner, age: 12, team: Team.red);
  var potato = hams
    ..name = 'hamsm'
    ..xp = XPLevel.medium
    ..team = Team.blue
    ..sayHello();
}
