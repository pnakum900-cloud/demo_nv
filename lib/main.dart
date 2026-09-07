// import 'package:demo_nv/Calculator/calculator.dart';
// import 'package:demo_nv/stopwatch/loginscreen.dart';
// import 'package:demo_nv/stopwatch/stopwatch.dart';
// import 'package:demo_nv/checkbox/checkbox.dart';
import 'package:demo_nv/slide/slide1.dart';
// import 'package:demo_nv/stopwatch/stopwatch.dart';
import 'package:flutter/material.dart';
// import 'Calculator/calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: Calex()
      // home: StopWatchExample()
      // home: LoginFormScreen(),
      // home : checkboxx(),
      home : SlideEx(),
    );
  }
}