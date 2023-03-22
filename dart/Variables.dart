void main() {
  // 함수나 메소드 내부에 지역 변수를 선언할 때에는 var
  var hamster;
  hamster = "hamster";
  hamster = 3215;

  String name = "Hamster"; // class에서 변수나 property를 선언할 때에는 타입 지정
  dynamic good; // dynamic : 정말 필요한 경우에만 쓰는것이 권장됨. typescript의 any같은
  name = 'asda'; // 처음 선언한 타입과 다르면 에러가 발생한다 string -> number 이러면 안됨

  // ** null safety **
  // null safety는 어떤 변수나 데이터가 null이 될 수 있음을 명시하는 것
  String? cat = 'cat'; // ?을 넣으면 String도 null도 될 수 있음
  cat = null;

  // 기본 문법
  if (cat != null) {
    cat.isNotEmpty;
  }
  // 단축어
  cat?.isNotEmpty;

  final animal = 'hams'; // final : 변수의 변경을 막는다. const역할
  // late : 초기 데이터 없이 변수를 선언할 수 있게 해줌.
  // 그러나 데이터 값이 없다면 실행안됨
  // API를 쓸때 많이 쓰게 됨
  late final String dog;
  dog = "cute";
  print(dog);

  // const : compile-time에 알고 있어야 하는 값. 컴파일때 평가됨
  const damgon = 'nice';
}
