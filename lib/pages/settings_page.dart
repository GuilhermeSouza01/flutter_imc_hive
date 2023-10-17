import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Altura (m)'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _saveData();
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('nome', nomeController.text);
    double altura = double.tryParse(alturaController.text) ?? 0.0;
    await prefs.setDouble('altura', altura);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Dados salvos com sucesso!')));
  }
}
