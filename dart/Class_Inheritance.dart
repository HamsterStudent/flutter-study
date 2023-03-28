class Human {
  final String name;
  Human(this.name);
  void sayHello() {
    print("Hi my name is $name");
  }
}

enum Team { blue, red }

class Player extends Human {
  final Team team;

  // super : 부모 클래스와 상호작용 할 수 있게 해줌
  Player({required this.team, required String name}) : super(name);

  // @override : 상속받은 function을 개조하기 위해 씀
  @override
  void sayHello() {
    // super로 상속받는 클래스에 접근가능
    super.sayHello();
    print("and I play for ${team}");
  }
}

void main() {
  var player = Player(
    team: Team.red,
    name: 'hamster',
  );
}
