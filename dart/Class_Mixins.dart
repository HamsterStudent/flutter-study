// extend : 부모 클래스가 됨. super를 통해서 접근 가능
// mixin : 다른 클래스 내부의 프로퍼티와 메소드를 가져옴. 그냥 가져옴 부모아님

class Strong {
  final double strenghtLevel = 1500.99;
}

class QuickRunner {
  void runQuick() {
    print("reuuuuun!!");
  }
}

class Tall {
  final double height = 1.99;
}

enum Team { blue, red }

class Player with Strong, QuickRunner, Tall {
  final Team team;

  // super : 부모 클래스와 상호작용 할 수 있게 해줌
  Player({required this.team, required String name});
}

// Mixins는 여러 곳에 재사용 가능함
class Horse with Strong, QuickRunner {}

class Hamster with QuickRunner {}

void main() {
  var player = Player(
    team: Team.red,
    name: 'hamster',
  );
  player.runQuick();
}
