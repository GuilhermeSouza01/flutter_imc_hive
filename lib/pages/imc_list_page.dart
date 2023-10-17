import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:imc_calculator_db/imc.dart';
import 'package:imc_calculator_db/models/imc_model.dart';

class IMCListPage extends StatefulWidget {
  const IMCListPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IMCListPageState createState() => _IMCListPageState();
}

class _IMCListPageState extends State<IMCListPage> {
  List<IMC> imcList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de IMCs"),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<ImcModel>('imcBox').listenable(),
        builder: (context, Box<ImcModel> box, _) {
          if (box.isEmpty) {
            return const Center(
              child: Text('Não há registros de IMC.'),
            );
          } else {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                ImcModel? imc = box.getAt(index);
                double imcValue = imc!.calcularIMC();
                String imcResult = imc.classificarIMC();
                return ListTile(
                  title: Text('Nome: ${imc.nome}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('IMC: ${imcValue.toStringAsFixed(2)}'),
                      Text('Classificação: $imcResult'),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
