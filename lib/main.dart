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
      debugShowCheckedModeBanner: false,
      //showSemanticsDebugger: true,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black12,
      ),
      routes: {
        'homescreen' : (_) => const HomeScreen()
      },
      initialRoute: 'homescreen',
    );
  }
}

