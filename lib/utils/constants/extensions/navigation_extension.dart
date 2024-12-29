import 'package:flutter/material.dart';

extension NavigationExtensions on BuildContext {
  MaterialPageRoute _materialPageRoute(page) =>
      MaterialPageRoute(builder: (_) => page);

  void replace(Widget page) =>
      Navigator.pushReplacement(this, _materialPageRoute(page));

  void to(Widget page) => Navigator.push(this, _materialPageRoute(page));

  void removeAll(Widget page) => Navigator.pushAndRemoveUntil(
      this, _materialPageRoute(page), (route) => route.isCurrent);

  void back() => Navigator.pop(this);
}
