import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:imc_calculator_db/models/imc_model.dart';

class ImcEntryPage extends StatefulWidget {
  const ImcEntryPage({super.key});

  @override
  State<ImcEntryPage> createState() => _ImcEntryPageState();
}

class _ImcEntryPageState extends State<ImcEntryPage> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  TextEditingController nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar IMC"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Peso (kg)'),
            ),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Altura (m)'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _cadastrarIMC();
              },
              child: const Text('Cadastrar IMC'),
            ),
          ],
        ),
      ),
    );
  }

  void _cadastrarIMC() {
    String nome = nomeController.text.trim();
    double peso = double.tryParse(pesoController.text) ?? 0.0;
    double altura = double.tryParse(alturaController.text) ?? 0.0;

    if (nome.isNotEmpty && peso > 0 && altura > 0) {
      ImcModel imc = ImcModel(peso, altura, nome);
      Hive.box<ImcModel>('imcBox').add(imc);
      Fluttertoast.showToast(
        msg: 'IMC cadastrado com sucesso!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Por favor, preencha todos os campos corretamente.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}
