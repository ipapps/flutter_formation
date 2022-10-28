import 'dart:async';

void asyncs() async {
  final stream = manageTime();

  stream.listen((event) {
    print(event);
  });

  final completer = Completer<String>();

  completer.complete("");

  completer.future;
}

Stream<String> manageTime() async* {
  int i = 0;
  while (i++ < 10) {
    await wait();
    yield DateTime.now().toIso8601String();
  }
  return;
}

String nowString() {
  return "hello";
}

Future<String> laterString() {
  wait();
  return Future.value("goodbye");
}

Future<String> realLaterString() {
  return wait().then((v) {
    return "goodbye";
  });
}

Future<dynamic> wait() => Future.delayed(const Duration(seconds: 1));

Future<String> easierLaterString() async {
  await wait();
  return "goodbye";
}

Future<String> sameLaterString() async {
  await wait();
  return Future.value("goodbye");
}

Future<String> failingString() async {
  await wait();
  throw "broken";
  return "goodbye";
}

void printNumbers() {
  print(1);
  printAfterOneSecond();
  print(3);
}

void printAfterOneSecond() async {
  await wait();
  print(2);
}
