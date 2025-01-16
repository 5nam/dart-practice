class Idol {
  final String name;

  Idol(String name) : this.name = name;

  void sayName() {
    print('저는 ${this.name}입니다.');
  }
}

void main() {
  Idol blackPink = Idol('블랙핑크');

  blackPink.sayName();

  Idol bts = Idol('BTS');
  bts.sayName();
}