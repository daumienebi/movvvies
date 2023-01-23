import 'package:flutter/material.dart';
import 'package:movvvies/view/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      //showSemanticsDebugger: true,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.teal,
      ),
      routes: {
        'homescreen' : (_) => const HomeScreen()
      },
      initialRoute: 'homescreen',
    );
  }
}

