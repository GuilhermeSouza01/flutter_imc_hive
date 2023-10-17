import 'package:hive/hive.dart';

part 'imc_model.g.dart';

@HiveType(typeId: 0)
class ImcModel {
  @HiveField(0)
  double peso;

  @HiveField(1)
  double altura;

  @HiveField(2)
  String nome;

  ImcModel(this.peso, this.altura, this.nome);

  double calcularIMC() {
    return peso / (altura * altura);
  }

  String classificarIMC() {
    double imc = calcularIMC();
    if (imc < 16) {
      return 'magreza grave';
    } else if (imc > 16 && imc < 17) {
      return 'o magreza moderada';
    } else if (imc >= 17 && imc < 18.5) {
      return 'magreza leve';
    } else if (imc >= 18.5 && imc < 25) {
      return 'peso normal';
    } else if (imc >= 25 && imc < 30) {
      return 'sobrepeso';
    } else if (imc >= 30 && imc < 35) {
      return 'obesidade grau 1';
    } else if (imc >= 35 && imc < 40) {
      return 'obesidade grau 2';
    } else {
      return 'obesidade grau 3';
    }
  }
}
