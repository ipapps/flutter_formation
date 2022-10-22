extension StringsExtensions on String {
  String reversed() {
    return split('').reversed.join();
  }

  int get numberOfUpperCase {
    return split('').where((element) => element.toUpperCase() == element).length;
  }

  operator <(String other) {
    return length < other.length;
  }
}
