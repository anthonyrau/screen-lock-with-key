import 'package:flutter/material.dart';
import 'package:screen_lock_with_key/screen_lock/blocking.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Blocking()
    );
  }
}
