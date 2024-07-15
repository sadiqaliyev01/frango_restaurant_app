import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:frango_restaurant_app/app.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('settings');
  runApp(const MyApp());
}
