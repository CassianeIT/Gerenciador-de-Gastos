import 'package:app_budget/APIServices/request.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


//Arrays para média de gastos:
var newValuesListCasa = [];
var newValuesListEducacao = [];
var newValuesListEletro = [];
var newValuesListLazer = [];
var newValuesListRest = [];
var newValuesListServ = [];
var newValuesListSuper = [];
var newValuesListTrans = [];
var newValuesListVest = [];
var newValuesListViagem = [];
var newValuesListOutros = [];
var totalGasto = 0.0;

class Functions {
  
  String getCurrency(double valor) {

    NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return formatter.format(valor);

  }

  BoxDecoration myContainerDecoration() {

    return BoxDecoration(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    );

  }

  TextSpan myTextSpanDecoration(String category, String text) {
    return TextSpan(
    children: <TextSpan>[
    TextSpan(
      text: "${category.toUpperCase()}",
      style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold),
      ),
      TextSpan(
      text: "$text", style: TextStyle(color: Colors.white),
      ),
    ],
    );
  }

  InputDecoration myTextFieldDecoration(int icon) {

    return InputDecoration(
      icon: Icon(IconData(icon, fontFamily: 'MaterialIcons'),
        color: Colors.white, size: 30),
      hintText: "Digite o valor gasto e aguarde",
      hintStyle: TextStyle(fontSize: 13.0, color: Colors.white70),
      suffixIcon: Icon(
        Icons.create, color: Colors.white, size: 18),
    );

  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Digite um valor válido"),
              content: Text("Valor digitado: R\$ 0,00"),
            ));
  }

  setBudget(BuildContext context, int id, int index, double newValue) {

    switch (id) {
      case 1:
        newValue == 0.0 ? _showAlert(context) : newValuesListCasa.add(newValue);
        totalGasto = newValuesListCasa.reduce((total, valor) => total + valor);
        Api().updateBudget(index, newValuesListCasa, totalGasto);
        break;

      case 2:
        newValue == 0.0 ? _showAlert(context) : newValuesListEducacao.add(newValue);
        totalGasto = newValuesListEducacao.reduce((total, valor) => total + valor);
        Api().updateBudget(index, newValuesListEducacao, totalGasto);
        break;

      case 3:
        newValue == 0.0 ? _showAlert(context) : newValuesListEletro.add(newValue);
        totalGasto = newValuesListEletro.reduce((total, valor) => total + valor);
        Api().updateBudget(index, newValuesListEletro, totalGasto);
        break;

      case 4:
        newValue == 0.0 ? _showAlert(context) : newValuesListLazer.add(newValue);
        totalGasto = newValuesListLazer.reduce((total, valor) => total + valor);
        Api().updateBudget(index, newValuesListLazer, totalGasto);
        break;

      case 5:
        newValue == 0.0 ? _showAlert(context) : newValuesListRest.add(newValue);
        totalGasto = newValuesListRest.reduce((total, valor) => total + valor);
        Api().updateBudget(index, newValuesListRest, totalGasto);
        break;

      case 6:
        newValue == 0.0 ? _showAlert(context) : newValuesListServ.add(newValue);
        totalGasto = newValuesListServ.reduce((total, valor) => total + valor);
        Api().updateBudget(index, newValuesListServ, totalGasto);
        break;

      case 7:
        newValue == 0.0 ? _showAlert(context) : newValuesListSuper.add(newValue);
        totalGasto = newValuesListSuper.reduce((total, valor) => total + valor);
        Api().updateBudget(index, newValuesListSuper, totalGasto);
        break;

      case 8:
        newValue == 0.0 ? _showAlert(context) : newValuesListTrans.add(newValue);
        totalGasto = newValuesListTrans.reduce((total, valor) => total + valor);
        Api().updateBudget(index, newValuesListTrans, totalGasto);
        break;
        
      case 9:
        newValue == 0.0 ? _showAlert(context) : newValuesListVest.add(newValue);
        totalGasto = newValuesListVest.reduce((total, valor) => total + valor);
        Api().updateBudget(index, newValuesListVest, totalGasto);
        break;

      case 10:
        newValue == 0.0 ? _showAlert(context) : newValuesListViagem.add(newValue);
        totalGasto = newValuesListEducacao.reduce((total, valor) => total + valor);
        Api().updateBudget(index, newValuesListViagem, totalGasto);
        break;

      case 11:
        newValue == 0.0 ? _showAlert(context) : newValuesListOutros.add(newValue);
        totalGasto = newValuesListOutros.reduce((total, valor) => total + valor);
        Api().updateBudget(index, newValuesListOutros, totalGasto);
        break;
    }

    return totalGasto;
  }

}

