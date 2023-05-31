T getFirstList<T>(List<T> list) {
  return list[0];
}

// typedef Printer = T Function<T>(T); // WRONG
// typedef Printer<T> = T Function(T); // RIGHT
// or
// typedef T Printer<T>(T); // WRONG
typedef T Printer<T>(T value); // RIGHT

T handlePrinter<T>(Printer<T> fn, T arg) {
  return fn(arg);
}

String printString(String value) {
  print("This is from printer string $value");
  return value;
}

int printInteger(int value) {
  print("This is from printer Integer $value");
  return value;
}

void patterns(dynamic any) {
  switch (any) {
    case int:
      print("Integer");
    case [String a, String b]:
      print("Array of string fix length 2, $a, $b");
    case [int a, int b]:
      print("Array of integer fix length 2, $a, $b");
    case [int a, ..., int b]:
      print("Array of integer no fix length, $a, $b");
    case (String a, var b):
      print("Record of string+any fix length 2, $a, $b");
    case ['a' || 'b', var c]:
      print("First either `a` or `b`, second is any $c");
    case >= 1 && <= 10:
      print('1 >= $any <= 10');
  }
}

String logicalOrPattern(num i) {
  return switch (i) {
    1 => "one",
    _ => "not 1"
  };
}

Iterable<int> syncIterableGen(int n) sync* {
  int k = 0;
  while (k < n) yield k++;
}

Stream<int> asyncStreamGenerator(int n) async* {
  int k = 0;
  while (k < n) yield k++;
}

Map<dynamic, Function> dict= {};

class Foo {}
class Bar {}

void addToDict<T>(Function fn) {
  dict[T] = fn;
}

Function? getFromDict<T>() {
  return dict[T] ?? null;
}

void main() async {

  var name = "John";
  // name = 12;   // error
  dynamic age = 12;
  // age = "12";  // ok

  String strValue = "Hello";
  int intValue = 1;
  num numIntValue = intValue;
  double dblValue = 1.3;
  num numDblValue = dblValue;
  bool human = true;

  var rcrd = ('first', a: 2, b: true, 'last');
  print(rcrd.$1 + " " + rcrd.a.toString() + " " + rcrd.b.toString() + " " + rcrd.$2);

  (String, int) rcrdType = ("String", 1);
  ({String reqName1, int reqName2}) rcrdAnttnType = (reqName1: "String", reqName2: 1);

  (String, int) rcrd1 = ("String", 1);
  (String, int) rcrd2 = ("String", 1);
  rcrd1 = rcrd2;

  ({String a, int b}) rcrd3 = (a: "String", b: 1);
  ({String a, int b}) rcrd4 = (a: "String", b: 1);
  ({String x, int y}) rcrd5 = (x: "String", y: 1);
  rcrd3 = rcrd4;
  // rcrd4 = rcrd5; // not same type

  var listInt = <int>[1,2];
  var listInt2 = listInt;
  List<int> listInt3 = [...listInt2];

  var set1 = {"one", "two"};
  var set2 = <String>{...set1};
  Set<String> set3 = set2;

  var map1 = {"key": 1};
  var map2 = Map<String, num>();
  map2.addAll(map1);
  Map<String, num> map3 = map2;

  int frstInt = getFirstList<int>(listInt3);
  int retInt = handlePrinter<int>(printInteger, frstInt);
  print("Return from printInteger $retInt");

  String frstStr = getFirstList<String>(<String>[for (var x in set3) x]);
  String retStr = handlePrinter<String>(printString, frstStr);
  print("Return from printString $retStr");

  patterns(retInt.runtimeType);
  patterns([1, 2]);
  patterns([1, 2, 3, 4, 5]);
  patterns(["one", "two"]);
  patterns(("one", 2));
  patterns(["a", 100]);
  patterns(5);

  print(logicalOrPattern(1));
  print(logicalOrPattern(10));

  var [la, lb] = listInt3;
  var [la2, ...any, lb2] = [...listInt3, 3, 4];
  print(any); // 2, 3
  var (ra, rb) = rcrd2;
  var (a: ra2, b: rb2) = rcrd3;
  var (a: ra3, rb3) = (a: "one", "two");
  var (rla as String, [rlb, rlc]) = ('str', [1, 2]);

  Iterable<int> valSync = syncIterableGen(3);
  for (final element in valSync) {
    print("sync $element");
  }

  Stream<int> valAsync = asyncStreamGenerator(3);
  await for (final element in valAsync) {
    print("async $element");
  }

  addToDict<Foo>(() => Foo());
  Function? fooFn = getFromDict<Foo>();
  print(fooFn != null ? fooFn() : 'Foo not exist');

  addToDict<Bar>(() => Bar());
  Function? barFn = getFromDict<Bar>();
  print(barFn != null ? barFn() : 'Bar not exist');
}
