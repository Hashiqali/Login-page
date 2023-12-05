import 'package:flutter/material.dart';
import 'package:login_page/screen/splash.dart';

const key = 'admin'; //initialized

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.green),
      home: slsh(),
    );
  }
}
