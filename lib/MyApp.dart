import 'package:flutter/material.dart';
import 'package:tyrads_test/ui/home.dart';

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tyrads Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StepperHome(),
    );
  }
}