void main() {

  // var : 변수에 값이 들어가면 자동으로 타입을 추론, 명시적 타입 선언 X
  // 추론된 타입은 고정되고, 변경 시에 다른 변수 타입의 값으로 저장하려고 하면 오류 발생
  var name = '코드팩토리';
  print(name);

  name = 'ㅇㄴㅇ';
  print(name);

  // dynamic : 변수의 타입이 고정되지 않아서 다른 타입의 값으로 저장 가능
  dynamic name2 = '코드 팩토리';
  name2 = 1;
  print(name2);

  // final/const
  final String name3 = '블랙핑크';
  // name3 = 'BTS'; -> 오류 발생, final 로 선언한 변수는 선언 후 값 변경 불가

  const String name4 = 'BTS';
  // name4 = '블랙핑크'; -> 오류 발생, const 로 선언한 변수는 선언 후 값 변경 불가

  // final 과 const 의 차이
  /**
   * 코드를 실행하지 않은 상태에서 값이 확정 -> const
   * 코드를 실행할 때 값이 확정 -> final
   */
  final DateTime now = DateTime.now();
  print(now);

  // 오류 발생. const 는 빌드 타임에 값을 알 수 있어야 하는데, 해당 함수는 런타임에 반환되는 값으로 알 수 있기 때문
  // const DateTime now2 = DateTime.now();

  // 변수 타입
  /**
   * var 키워드를 사용하면 자동으로 변수 타입을 유추 가능하지만, 타입을 명시해주면 코드가 더 직관적
   * 유지보수가 편리해짐
   */
  String name0 = '코드팩토리';
  int isInt = 10;
  double isDouble = 2.5;
  bool isTrue = true;

  // 컬렉션 : 여러 값을 하나의 변수에 저장할 수 있는 타입
  /**
   * List : 여러 값을 순서대로 저장
   * Map : 특정 키값을 기반으로 빠르게 값 검색
   * Set : 중복된 데이터를 제거할 때
   */
  // 컬렉션은 서로 타입으로 자유롭게 형변화이 가능하다는 매우 큰 장점 존재

  // 리스트
  List<String> blackPinkList = ['리사', '지수', '제니', '로제'];

  print(blackPinkList);
  print(blackPinkList[0]);
  print(blackPinkList[3]);

  print(blackPinkList.length);

  blackPinkList[0] = '코드팩토리';
  print(blackPinkList);

  // 리스트 : add 함수
  blackPinkList.add("ㅇㄴㅇ");

  // 리스트 : where 함수
  /**
   * List에 있는 값들을 순서대로 순회하면서 특정 조건에 맞는 값만 필터링
   */

  final newList = blackPinkList.where(
      (name) => name == '제니' || name == '로제', // 제니 또는 로제만 유지
  );

  print(newList);
  print(newList.toList());

  // 리스트 : map 함수
  /**
   * 리스트에 있는 값들을 순서대로 순회하면서 값을 변경할 수 있음
   * 매개변수에 함수를 입력해야 하며 입력된 함수는 기존 값을 하나씩 매개변ㅅ로 입력받음
   * 반환 값이 현재 값을 대체하면 순회가 끝나면 Iterable이 반환
   */
  final newBlackPink = blackPinkList.map(
      (name) => '블랙핑크 $name', // 리스트의 모든 값 앞에 '블랙핑크' 추가
  );
  print(newBlackPink);
  print(newBlackPink.toList()); // Iterable을 List로 다시 변환하고 싶을 때

  /**
   * 리스트 : reduce()
   * 리스트에 있는 값들ㅇ르 순회하면서 매개변수에 입력된 함수들 실행
   * reduce 함수는 순회할 때마다 값을 쌓아가는 특징 있음
   * reduce 함수는 List 멤버의 타입과 같은 타입 반환(지금까지 배운 함수들은 모두 Iterable 반환)
   */
  /**
   * 기존 함수들과 다르게 reduce() 는 매개변수로 함수를 입력받고, 해당 함수는 매개변수 2개를 입력받음
   * 첫 번째 순회 : 첫 번째 매개변수(value)는 리스트의 첫 번째 값 즉, '리사'를 받게 되고 두 번째 매개변수(element)는 '지수'를 받게 됨
   * 두 번째 순회 : 첫 번째 매개변수(vlaue)는 리스트의 세 번째 값 '제니', 두 번째 매개변수(element)는 '로제'를 받게 됨
   * 즉, 리스트 내부의 값들을 점차 더해가는 기능으로 사용
   */
  final allMembers = blackPinkList.reduce((value, element) => value + ', ' + element);

  print(allMembers);

  /**
   * 리스트 : fold()
   * reduce() 함수와 실행 논리 똑같음.
   * reduce() 는 함수가 실행되는 리스트 요소들의 타입이 같아야 함
   * fold() 는 함수가 실행되는 리스트 요소들의 타입이 어떠한 타입이든 반환 가능
   */
  /**
   * 첫 번째 순회 :
   * 리스트의 첫 번째 값이 아닌, fold() 함수의 첫 번재 매개변수에 입력된 값이 초깃값으로 사용됨.
   * 두 번째 매개변수인 (vlaue, element) => value + element.length 는 람다식으로 최초 순회 때 value(초깃값, 여기서 0)이 입력되고 이후에는 기존 순회 반환값이 입력
   * element 는 reduce() 와 마찬가지로 리스트의 다음 값 입력
   */
  final allMembers2 = blackPinkList.fold<int>(0, (value, element) => value + element.length); // 14 가 나옴. 차례로 5 + 2 + 2 + 2 + 3 = 14 더해지도록

  print(allMembers2);

  /**
   * Map 타입
   * - 맵은 키와 값의 짝을 저장. 맵은 키를 이용해서 원하는 값을 빠르게 찾는 데 중점
   * Map<키 타입, 값 타입> 맵 이름
   * 이런 식으로 생성
   */
  Map<String, String> dictionary = {
    'Harry Potter': '그리핀도르',
    'Malfoy' : '슬리데린',
    'Cedric' : '후플푸프',
  };
  print(dictionary['Harry Potter']);
  print(dictionary['Malfoy']);

  // 키와 값 반환받기
  print(dictionary.keys);
  // Iterable 이 반환되기 때문에 .toList()를 실행해서 리스트를 반환받을 수 있음
  print(dictionary.values.toList());

  /**
   * Set 타입
   * 셋은 중복 없는 값들의 집합
   * Set<타입> 세트이름
   */
  Set<String> names = {'로제', '해리포터', '제니', '헤르미온느', '론', '해리포터'};

  print(names);
  print(names.contains('로제'));
  print(names.toList());

  List<String> names2 = ['로제', '지수', '지수'];
  print(names2);
  print(Set.from(names2)); // 리스트 -> 셋

  /**
   * enum
   * 한 변수의 값을 몇 가지 옵션으로 제한하는 기능
   * 선택지가 제한적일 때 사용
   *
   * String 으로 완전 대체할 수 있지만, enum 은 기본적으로 자동 완성이 지원되고,
   * 정확히 어떤 선택지가 존재하는지 정의하고 제한해둘 수 있으믐로 유용
   */
  Status status = Status.approved;
  print(status);

}

enum Status {
  approved,
  pending,
  rejected,
}