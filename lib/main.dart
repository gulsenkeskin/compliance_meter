import 'package:compliance_meter/home_page.dart';
import 'package:compliance_meter/input_theme.dart';
import 'package:flutter/material.dart';

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
        primarySwatch: Colors.purple,
        inputDecorationTheme: CustomInputTheme().theme(),
      ),
      home:HomePage()
    );
  }
}
