import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'boleto_model.dart';

class InsertBoletoController {
  //flutter quem realiza as validações
  final formKey = GlobalKey<FormState>();
  BoletoModel model = BoletoModel();

  //validação
  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;
  String? validateVencimento(String? value) =>
      value?.isEmpty ?? true ? "A data de vencimento não pode ser vazio" : null;
  String? validateValor(double value) =>
      value == 0 ? "Insira um valor maior que R\$ 0,00" : null;
  String? validateCodigo(String? value) =>
      value?.isEmpty ?? true ? "O código do boleto não pode ser vazio" : null;

  //armazena o que foi digitado
  void onChange({
      String? name,
      String? dueDate,
      double? value,
      String? barcode}) {
    model = model.copyWith(
        name: name,
        dueDate: dueDate,
        value: value,
        barcode: barcode);
  }

  Future<void> saveBoleto() async {
    final instance = await SharedPreferences.getInstance();
    final boletos = instance.getStringList("boletos") ?? <String>[];
    boletos.add(model.toJson());
    await instance.setStringList("boletos", boletos);
    return;
  }

 //valida automaticamente o form
  Future<void> cadastrar() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      return await saveBoleto();
    }
  }
}