import 'package:flutter/material.dart';
import 'package:imc_calculator_db/models/imc_model.dart';
import 'package:imc_calculator_db/pages/home_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(ImcModelAdapter());
  await Hive.openBox<ImcModel>('imcBox');
  runApp(MyApp());
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
        body: HomePage(),
      ),
    );
  }
}
