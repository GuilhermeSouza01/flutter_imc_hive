import 'package:flutter/material.dart';
import 'package:imc_calculator/imc.dart';

class IMCListScreen extends StatefulWidget {
  const IMCListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IMCListScreenState createState() => _IMCListScreenState();
}

class _IMCListScreenState extends State<IMCListScreen> {
  List<IMC> imcList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: imcList.length,
            itemBuilder: (context, index) {
              IMC imc = imcList[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Peso: ${imc.peso} kg'),
                      Text('Altura: ${imc.altura} m'),
                      Text('IMC: ${imc.calcularIMC().toStringAsFixed(2)}'),
                      Text('Classificação: ${imc.classificarIMC()}'),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              _showInputDialog(context);
            },
            child: const Text('Calcular Novo IMC'),
          ),
        ),
      ],
    );
  }

  void _showInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController pesoController = TextEditingController();
        TextEditingController alturaController = TextEditingController();

        return AlertDialog(
          title: const Text('Inserir Peso e Altura'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
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
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                double peso = double.tryParse(pesoController.text) ?? 0.0;
                double altura = double.tryParse(alturaController.text) ?? 0.0;
                IMC imc = IMC(peso, altura);
                setState(() {
                  imcList.add(imc);
                });
                Navigator.pop(context);
              },
              child: const Text('Calcular'),
            ),
          ],
        );
      },
    );
  }
}
