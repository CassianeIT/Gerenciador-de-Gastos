import 'package:app_budget/APIServices/request.dart';
import 'package:app_budget/Controllers/controller.dart';
import 'package:app_budget/Model/Budget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BudgetList extends StatefulWidget {
  final String title;
  const BudgetList({Key? key, required this.title}) : super(key: key);

  @override
  _BudgetListState createState() => _BudgetListState();
}

class _BudgetListState extends State<BudgetList> {
  var budgets = const [];
  var indexGeral = 0;
  var text = "0.0";

  bool visibilityButtonsBar = false;
  String valueTextField = "";
  double newValue = 0.0;

  get _controller => TextEditingController();
  List<Budget>? _budgets;

  void getStartBudget() async {
    _budgets = await Api().get();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getStartBudget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          widget.title,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
        ),
      ),
      body: new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          _changed(false, "buttonsBar");
        },
        child: Column(
          children: [
            _budgets == null
                ? CircularProgressIndicator()
                : Expanded(
                    child: ListView.builder(
                        itemCount: _budgets!.length,
                        itemBuilder: (BuildContext context, int index) {
                          Budget budgets = _budgets![index];

                          budgets.newValue.isEmpty
                              ? text = "\nMédia de Gastos: R\$ 0,00"
                              : text =
                                  "\nMédia de Gastos: ${Functions().getCurrency(budgets.monthlyAvg / budgets.newValue.length)}";

                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 30.0, right: 30.0, top: 15.0),
                            child: Container(
                              padding: const EdgeInsets.all(20.0),
                              decoration: Functions().myContainerDecoration(),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 42.0),
                                      child: Text.rich(
                                        Functions().myTextSpanDecoration(budgets.category, text),
                                      ),
                                    ),

                                    TextField(
                                      controller: _controller,
                                      onTap: () {
                                        print("Habilitado buttons");
                                        visibilityButtonsBar ? null : _changed(true, "buttonsBar");
                                        indexGeral = budgets.index;
                                      },
                                      onChanged: (newValue) {
                                        valueTextField = newValue;
                                      },
                                      autofocus: false,
                                      keyboardType:
                                          TextInputType.numberWithOptions(
                                              decimal: true),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                      decoration: Functions()
                                          .myTextFieldDecoration(
                                              budgets.iconId),
                                    ),
                                    //TextField
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
            visibilityButtonsBar ? ButtonTheme(
                    child: ButtonBar(
                      alignment: MainAxisAlignment.spaceAround,
                      children: myWidgetButton(context),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  List<Widget> myWidgetButton(BuildContext context) {
    return <Widget>[
      TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Colors.red, minimumSize: Size(70, 10)),
        child: Text('Cancelar',
            style: TextStyle(color: Colors.white, fontSize: 12)),
        onPressed: () {
          print("Cancel pressed");
          _changed(false, "buttonsBar");
          FocusScope.of(context).requestFocus(new FocusNode());
        },
      ),
      TextButton(
        style: TextButton.styleFrom(
            primary: Colors.greenAccent,
            minimumSize: Size(70, 10),
            backgroundColor: Colors.green),
        child:
            Text('Salvar', style: TextStyle(color: Colors.white, fontSize: 12)),
        onPressed: () {
          newValue = double.tryParse(valueTextField.replaceAll(",", ".")) ?? (0);
          valueTextField = "";
          var index = indexGeral + 1;
          int id = index;

          Functions().setBudget(context, id, index, newValue);

          _changed(false, "buttonsBar");
          FocusScope.of(context).requestFocus(new FocusNode());
          getStartBudget();
        },
      ),
    ];
  }

//Configurando visiblizadade dos buttonsBar
  void _changed(bool visibility, String field) {
    setState(() {
      budgets = _budgets!;
      field == "buttonsBar" ? visibilityButtonsBar = visibility : null;
    });
  }
}
