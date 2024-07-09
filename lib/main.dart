import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'main.g.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

@swidget
Widget _mainApp(BuildContext context) {
  return const MaterialApp(
    home: Scaffold(
      body: Center(
        child: Text('Hello World!'),
      ),
    ),
  );
}
