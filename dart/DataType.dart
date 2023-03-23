void main() {
  // dart는 대부분 object로 이루어져있다.
  // 객체지향언어
  String name = 'hamster';
  bool alive = true;
  int age = 4;
  double money = 30.78;

  // num : integer나 double형이 될 수 있음
  num x = 12;
  x = 1.1;

  // list
  var numbers = [1, 2, 3, 4, 5, 6];
  List<int> numbers1 = [1, 2, 3, 4, 5, 6];
  // 리스트 구조가 복잡하면 마지막 요소 뒤에 , 를 넣어주면 줄바꿈 정렬이 된다
  var numbers2 = [
    2,
    4,
    8,
    6,
    512,
  ];
  // collection if : 조건에 따른 값을 넣을 수 있다.
  var givMeFive = true;
  var numbers3 = [
    35,
    32,
    54,
    6554,
    215,
    if (givMeFive) 1421,
  ];
  print(numbers3);

  numbers.first;
  numbers.last;
  numbers.add(321);

  print(numbers);

  // $ : 변수를 가져옴 $변수이름 으로 쓴다.
  // 연산이 필요할 때에는 ${변수명 + 연산값}
  var greeting = "Hello everyone, my name is $name, and I\'m ${age + 23}";
  print(greeting);

  // collection for
  var oldFriends = ['hamster', 'karl'];
  var newFriends = [
    'yan',
    'yanic',
    for (var friend in oldFriends) "★ $friend",
  ];
  print(newFriends);

  // Map
  Map<String, Object> player = {
    'name': 'hamster',
    'xp': 305,
    'superpower': true,
  };
  Map<List<int>, bool> player1 = {
    [1, 2, 3, 4]: true,
  };
  List<Map<String, Object>> player2 = [
    {'name': 'hamster', 'xp': 255648},
    {'name': 'hamster', 'xp': 255648},
  ];

  // Set : 순서가 있다. List와 같지만 모든 요소가 유니크
  // 요소가 항상 하나씩만 있어야 한다면 Set을 사용
  Set<int> numbers4 = {1, 2, 3, 4};
}
