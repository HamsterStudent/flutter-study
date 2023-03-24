// void는 함수가 아무것도 리턴하지 않는다는 뜻
// 뭔가 리턴시키고 싶다면 함수의 데이터 타입을 써줘야한다.
void sayHello(String name) {
  print("Hello $name nice to meet you");
}

// fat arrow : 곧바로 return하는것과 같음. 한줄짜리일때 많이 사용
String sayHello2(String name) => "Hello $name nice to meet you";

// named parameter : 중괄호를 쓰게 되면 매개변수 이름을 그대로 써서 호출해야 한다.
// 디폴트값을 정해주지 않으면 에러남
// 매개변수가 들어가는 순서는 상관 없다.
String sayHello3(
    {String name = 'anon', int age = 99, String country = 'hams'}) {
  return "Hello $name, you are $age and you come from $country nice to meet you";
}

// required를 써서 매개변수를 필수로 받게 하는 방법
String sayHello4(
    {required String name, required int age, required String country}) {
  return "Hello $name, you are $age and you come from $country nice to meet you";
}

// optional positional parameter
// 일부분만 required하지 않게 하고 싶다면 []를 쓰고 ?로 not required표시, 디폴드 값 입력
String sayHello5(String name, int age, [String? country = "hamsKingdom"]) =>
    "Hello $name, you are $age and you come from $country nice to meet you";

// null인 경우에 출력하기
// 긴 버전
String capitalizeName(String? name) {
  if (name != null) {
    return name.toUpperCase();
  }
  return 'ANON';
}

// 짧은 버전(삼항연산자)
String capitalizeName1(String? name) =>
    name != null ? name.toUpperCase() : 'ANON';

// 더 짧은 버전(?? 사용) : 왼쪽이 null이면 오른쪽을 리턴
String capitalizeName2(String? name) => name?.toUpperCase() ?? 'ANON';

// 타입을 지정해서 변수형태로 저장해둘 수 있음. 간단버전이라고 하네요
typedef ListOfInts = List<int>;
ListOfInts reverseListOfNumbers(List<int> list) {
  var reversed = list.reversed;
  return reversed.toList();
}

void main() {
  String? name; // null일수도 있는 변수
  name ??= 'hamster'; // name가 null이라면 hamster를 할당해라
  print(name);

  print(reverseListOfNumbers([1, 2, 3]));
}
