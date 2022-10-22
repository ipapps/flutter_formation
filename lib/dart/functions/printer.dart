class Printer {
  static void printThis(bool boolean, String Function(bool boolean) transformation) {
    print(transformation.call(boolean));
  }
}