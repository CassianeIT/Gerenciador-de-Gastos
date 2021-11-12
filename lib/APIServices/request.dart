import 'package:app_budget/Model/Budget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Api {
  
var result = "PUT SUCESSO";

  Future<List<Budget>> get() async {
    
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Charset": "utf-8",
      "Accept-Charset":"utf-8"
    };

    http.Response response =
        await http.get(Uri.parse("https://61605a53faa03600179fba08.mockapi.io/fields"), headers: headers);
  
    return decode(response);
  }

  List<Budget> decode(http.Response response) {
    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);

      List<Budget> _budgets = decoded.map<Budget>((_budgets) {
        return Budget.fromJson(_budgets);
      }).toList();
    //  print(response.headers.values);
    //print(response.body);
    
      return _budgets;
    }
    
    return decode(response);
 
  }



   Future<Budget> updateBudget(int id, List newValue, double monthlyAvg) async {
    final responsePut = await http.put(
      Uri.parse('https://61605a53faa03600179fba08.mockapi.io/fields' + "/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'newValue': newValue,
        'monthlyAvg' : monthlyAvg
      }),
  );

    if (responsePut.statusCode == 200) {
     
      //Se o servidor retornar 200=OK, iremos analisar o JSON:
      print(responsePut.body);
      return Budget.fromJson(jsonDecode(responsePut.body));
    } else {
      // Se o servidor não retornou 200, lança uma exceção.
      throw Exception('Failed to update.');
    }
  }

}
