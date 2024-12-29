import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/di/locator.dart';
import 'package:frango_restaurant_app/app.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await init();
  await setupLocator();
  await Hive.openBox('settings');
  runApp(const MyApp());
}
