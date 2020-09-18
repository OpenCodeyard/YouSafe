import 'package:flutter/material.dart';
import 'package:yousafe/screens/screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouSafe',
      home: EmergencyScreen(),
    );
  }
}


