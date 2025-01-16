void main() {
  // 기본적으로 다른 언에서 제공하는 모든 연산자 제공
  /**
   * null 관련 연산자
   */
  // 타입 뒤에 ? 를 명시해야 null 값을 가질 수 있음
  double? number1 = null;
  // double number2 = null; -> 타입 뒤에 ? 를 명시하지 않아 에러 발생

  double? number; // 자동으로 null 저장
  print(number);

  number ??= 3; // ?? 를 사용하면 기존 값이 null 일 때만 저장
  print(number);

  number ??= 4; // null 이 아니므로 3이 유지
  print(number);

  /**
   * 타입 비교 연산자
   */
  int num = 1;

  print(num is int); // == 과 같은 것
  print(num is String);
  print(num is! int); // != 와 같은 것
  print(num is! String);
}