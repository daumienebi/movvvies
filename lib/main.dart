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
      //showSemanticsDebugger: true,
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Movvvies"),
        ),
        body: const Center(
            child: Text("Movvies",style: TextStyle(
                fontSize: 50,
              color: Colors.redAccent
            ),
            )
        ),
      )
    );
  }
}

