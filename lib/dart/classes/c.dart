class C {
  final int notNamed;
  final String optional;
  final String required;
  final String? nullable;
  String? canBeDoneLater;
  late String canBeDoneLaterButCanCrash;

  C(
      this.notNamed, {
        this.optional = "optional",
        required this.required,
        this.nullable,
      });
}
