import 'package:flutter/material.dart';
import 'package:yousafe/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const YouSafeApp());
}

class YouSafeApp extends StatelessWidget {
  const YouSafeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
