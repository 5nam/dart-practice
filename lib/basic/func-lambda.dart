void main() {
  /**
   * 1. 함수의 일반적인 특징
   * - 한 번 작성하고 여러 곳 재활용
   * - 반환 값 없을 때는 void 키워드 사용
   * - 다트 함수에서 매개변수를 지정하는 방법
   *  1. 순서가 고정된 매개변수(포지셔널 파라미터)
   *    : 입력된 순서대로 매개변수에 값이 지정
   *  2. 이름이 있는 매개변수(네임드 파라미터)
   *    : 네임드 파라미터를 사용하려면 중괄호와 required 키워드 사용
   *    : required 키워드는 매개변수가 null 값이 불가능한 타입이며 기본 값을 지정해주거나 필요수로 입력해야 한다는 의미
   */
  print(addTwoNumbers(1, 2));
  print(addTwoNumbers2(a: 1, b: 2));
  print(addTowNumbers3(1));
  print(addTowNumbers4(a:1));
  print(addTowNumbers5(1, b: 3, c: 7));

  /**
   * 익명 함수와 람다 함수
   * 통상적으로 많은 언어에서 함수/람다 함수를 구분하지만 다트에서는 구분 X
   * '기본적인 익명 함수', '람다식을 사용하는 익명 함수'로 나누어 설명(편의상)
   */
  /**
   * 익명함수
   * (매개 변수) {
   *    함수 바디
   *  }
   *
   *  람다 함수
   *  (매개변수) => 단 하나의 스테이트먼트
   */
  /**
   * 익명 함수에서 {} 를 빼고 => 기호를 추가한 것이 람다 함수
   * 매개 변수는 아예 없거나 하나 이상이어도 됨
   * 익명함수와 달리 코드 블록을 묶는 {} 가 없는 람다는 함수 로직을 수행하는 스테이트먼트가 딱 하이어야 함(한줄 X, 명령 단위가 하나)
   * 람다 함수는 이름을 정하고 미리 선언할 필요가 없어 글로벌 스코프를 다룰 필요 X
   * 하나의 스테이트먼트만 다루므로 적절히 사용하면 간결하고 가독성이 높음
   * 그래서 콜백 함수나 리스트의 map, reduce, fold 함수 등에서 일회성인 로직을 작성할 때 주로 사용
   */
  List<int> nums = [1,2,3,4,5];

  // 일반(익명) 함수로 모든 값 더하기
  final allNums = nums.reduce((value, element) {
    return value+element;
  });

  print(allNums);

  final allNums2 = nums.reduce((value, element) => value+element);
  print(allNums2);

  /**
   * typedef 와 함수
   * - typedef 키워드는 함수의 시그니처를 정의하는 값으로 보면 됨
   * - 여기서 시그니처는 반환 값 타입, 매개변수 개수와 타입 등을 말함
   * - 즉 함수 선언부를 정의하는 키워드, 함수가 무슨 동작을 하는지 정의는 없음
   */
  // typedef 는 일반적인 변수의 type 처럼 사용 가능
  Operation oper = add;
  oper(1,2);

  oper = subtract;
  oper(1,2);

  // 다트에서 함수는 일급 객체이므로 함수를 값처럼 사용 가능
  calculate(1, 2, add);

}

typedef Operation = void Function(int x, int y);

void calculate(int x, int y, Operation oper) {
  oper(x,y);
}

void add(int x, int y) {
  print('결과값 : ${x + y}');
}

void subtract(int x, int y) {
  print('결과값 : ${x - y}');
}


// 포지셔널
int addTwoNumbers(int a, int b) {
  return a+b;
}

// 네임드
int addTwoNumbers2({
  required int a,
  required int b,
}) {
  return a+b;
}

// 기본값을 갖는 포지셔널. [] 사용
int addTowNumbers3(int a, [int b = 2]) {
  return a+b;
}

// 기본값을 갖는 네임드. required 키워드 생략
int addTowNumbers4({
  required int a,
  int b = 2,
}) {
  return a+b;
}

// 포지셔널 + 네임드 섞어서 사용
int addTowNumbers5(int a, {
  required int b,
  int c = 4,
}) {
  return a+b+c;
}