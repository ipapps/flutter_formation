import 'package:flutter_formation/webservices/user.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveRepository {
  static final HiveRepository _singleton = HiveRepository._internal();

  late final Box<UserList> box;

  factory HiveRepository() {
    return _singleton;
  }

  init() async {
    await Hive.initFlutter();
    box = await Hive.openBox('users');
  }

  HiveRepository._internal();
}