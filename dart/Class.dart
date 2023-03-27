// class를 생성할 때는 타입을 꼭 명시해줘야함
class Player {
  // // 변경못하게하려면 final붙여야함
  // late final String name;
  // late int xp;

  // // constructor. class이름이랑 똑같이 설정해줘야함
  // Player(String name, int xp) {
  //   this.name = name;
  //   this.xp = xp;
  // }

  // 위의 구성체와 변수를 줄인 버전
  final String name;
  String team;
  int xp, age;
  // 이렇게 쓰면 순서대로 매개변수를 넣어줘야 함
  // Player(this.name, this.xp);

  // 이렇게 쓰면 순서대로 쓰지 않고 명시시켜줄수있다.
  // Named constructor parameter
  Player({
    required this.name,
    required this.xp,
    required this.team,
    required this.age,
  });

  // Named constructor. : 을 넣어서 player를 초기화
  Player.createBluePlayer({
    required String name,
    required int xp,
  })  : this.xp = xp,
        this.name = name,
        this.team = 'blue',
        this.age = 20;

  Player.createRedPlayer(
    String name,
    int age,
  )   : this.age = age,
        this.name = name,
        this.team = 'red',
        this.xp = 30;

  void sayHello() {
    // this.name으로 쓰는게 통상적인데 dart에선 생략하는편
    print("Hi $name : $xp");
  }
}

void main() {
  // 인스턴스 생성
  // new Player()랑 같음. new 써도되고 안써도됨
  // key : value 로 입력하기
  var player = Player.createBluePlayer(
    name: "hamster",
    xp: 465,
  );
  // positional
  var redPlayer = Player.createRedPlayer(
    "haer",
    5,
  );
  redPlayer.sayHello();
}
