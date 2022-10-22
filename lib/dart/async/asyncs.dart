void asyncs() async {
  print(nowString());
  print(laterString());

  await wait();

  print(nowString());
  laterString().then((value) => print(value));

  await wait();

  print(nowString());
  realLaterString().then((value) => print(value));

  await Future.delayed(const Duration(seconds: 2));

  print(nowString());
  print(await easierLaterString());

  await wait();

  print(nowString());
  print(await sameLaterString());

  await wait();

  print(nowString());
  try {
    print(await failingString());
  } catch (exception) {
    print(exception);
  }

  await wait();
  print(nowString());
  failingString()
      .then(
    (value) => print(
      value,
    ),
  )
      .catchError(
    (error) {
      print(error);
    },
  );
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
