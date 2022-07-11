import 'home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Endless ListView Module",
      home: Home());
}
