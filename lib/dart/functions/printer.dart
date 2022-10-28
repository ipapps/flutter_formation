void printThis2(bool boolean, String Function(bool boolean) transformation) {
  print(transformation.call(boolean));
}
