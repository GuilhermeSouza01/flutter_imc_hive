import 'package:flutter/material.dart';
import 'package:imc_calculator_db/pages/imc_entry_page.dart';
import 'package:imc_calculator_db/pages/imc_list_page.dart';
import 'package:imc_calculator_db/pages/settings_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const IMCListPage()),
                  );
                },
                child: const Text('Lista de IMCs'),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ImcEntryPage()),
                  );
                },
                child: const Text('Cadastrar IMC'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
