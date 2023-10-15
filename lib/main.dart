import 'package:flutter/material.dart';
import 'package:imc_calculator/pages/imc_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white)),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Imc Calculator"),
        ),
        body: IMCListScreen(),
      ),
    );
  }
}
