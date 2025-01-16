class Idol {
  final String name;
  final int membersCount;

  // 생성자
  Idol(String name, int membersCount):
      this.name = name,
      this.membersCount = membersCount;

  // 네임드 생성자 : 네임드 파라미터와 비슷한 개념. 일반적으로 클래스를 생성하는 여러 방법을 명시하고 싶을 때 사용
  // {클래스명.네임드 생성자명} 형식
  // 나머지 과정은 기본 생성자와 같음
  Idol.fromMap(Map<String, dynamic> map):
      this.name = map['name'],
      this.membersCount = map['membersCount'];



  void sayName() {
    print('저는 ${this.name}입니다. ${this.name} 멤버는 ${this.membersCount}명입니다.');
  }
}

void main() {
  Idol blackPink = Idol('블랙핑크', 4);
  blackPink.sayName();

  Idol bts = Idol.fromMap({
    'name': 'BTS',
    'membersCount' : 7,
  });
  bts.sayName();
}